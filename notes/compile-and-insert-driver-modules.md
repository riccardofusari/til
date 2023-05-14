# compile-and-insert-driver-modules

After you write a driver module, you need to compile it.

The easiest module is just one C file containing all the implementation of the VFS functions and the mandatory __init and __exit functions. For compile and use the driver in linux, there are two main ways:

1. Compile it together with the kernel (Linux → monolithic kernel)
2. Compile kernel modules. They are external modules that you can load at runtime

Assuming that you are writing a driver that manage leds, called LM_Module, the most basic Makefile to compile a single-file driver can assume this form

```bash
#Decide which is the ouput of the compiling process. Is like the -o of gcc. 
#This instruction is the name of one output of the compiler process 
obj-m+=lmmodule.o

#Sections of compilation. 
#With that you are compiling with the libraries present into the file system
all:
        make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules
clean:
        make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
```

```bash
riccardo@pcpucci:~/driver$ ls -l
total 468
-rw-rw-r-- 1 riccardo riccardo   9473 mar 29 12:20 lmmodule.c
-rw-rw-r-- 1 riccardo riccardo 220400 mar 29 15:37 lmmodule.ko
-rw-rw-r-- 1 riccardo riccardo     33 mar 29 15:37 lmmodule.mod
-rw-rw-r-- 1 riccardo riccardo   1144 mar 29 15:37 lmmodule.mod.c
-rw-rw-r-- 1 riccardo riccardo  49880 mar 29 15:37 lmmodule.mod.o
-rw-rw-r-- 1 riccardo riccardo 171976 mar 29 15:37 lmmodule.o
-rw-rw-r-- 1 riccardo riccardo    403 mar 29 12:28 Makefile
-rw-rw-r-- 1 riccardo riccardo     34 mar 29 15:37 modules.order
-rw-rw-r-- 1 riccardo riccardo      0 mar 29 15:37 Module.symvers
```

The lmmodule.ko is an object file that is used to extend the kernel of the Linux Distribution. For loading the driver in memory you need this commands

```bash

sudo insmod lmmodule.ko
```

At first, I had this error message:

> insmod: ERROR: could not insert module lmmodule.ko: Key was rejected by service
> 

After some research, I find out that since Ubuntu kernel 4.4.0-20 the EFI_SECURE_BOOT_SIG_ENFORCE kernel config has been enabled. That prevents from loading unsigned third party modules if UEFI Secure Boot is enabled.

So I needed to disable the Secure Boot in UEFI (BIOS) settings. I could do it using the grup menu at boot time, but I decided to do it easily from terminal using *mokutil*

```bash
sudo apt install mokutil
sudo mokutil --disable-validation
```

Reporting the words of the person who kindly help the web by resolving this issue:

> It will require to create a password. The password should be at least 8 characters long. After you reboot, UEFI will ask if you want to change security settings. Choose "Yes". Then you will be asked to enter the previously created password. Some UEFI firmware asks not for the full password, but to enter some characters of it, like 1st, 3rd, etc. Be careful. Some people do not understand this. I did not get it from the first attempt either ;-)
> 

So, now the module is inserted. You can check that with 

```bash
lsmod | grep lmmodule
```

```bash
-----------------Output--------------------------

lmmodule               16384  0
```

You can also check the kernel log (if you have implemented some printk) by using the command:

```bash
sudo dmesg 
```

```bash
-------------------Output-------------------------

[   26.491741] LM: Initializing the LMODULE LKM
[   26.491744] LM: registered correctly with major number 509
[   26.491768] LM: device class registered correctly
[   26.491870] LM: device class created correctly
```

For testing the driver we use this few lines of code:

```c
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>

int main() 
{

        int fd = open ("/dev/LM_module",O_RDWR  );
        if (fd < 0) 
				{
                perror ("Unable to open device");
        }

        unsigned int arg;
        long r =  ioctl(fd, 0x01 , &arg);

        if (r < 0) 
				{
                perror ("Unable to open device");
        }

        int buf;
        r = read (fd, &buf, sizeof(int));

        write (fd, &buf, sizeof(int));  

        close(fd);

}
```

Remember to launch the test as super user or with sudo.

For every driver function of the LM module that I’m using, there is a printk for check into the kernel log. So by typing the previous command, the output is

```bash
----------------------------Output-------------------------
[  880.836779] LM: Executing OPENRELEASE
[  880.836786] LM: Executing IOCTL
[  880.836788] LM: Executing READ
[  880.836789] LM: Executing WRITE
[  880.836803] LM: Executing OPENRELEASE
```

So, it works!

For removing the module from memory

```bash
sudo rmmod lmmodule
```