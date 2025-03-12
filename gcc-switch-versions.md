```bash
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
```

- The numbers at the end (e.g. `20` vs. `10`) are _priorities_. By default, the higher priority is used if you run `auto` mode. You can flip them if you want 10 to have a higher priority than 13—just ensure the commands reflect that.
- **Select** the default version with `update-alternatives --config`:

`There are 2 choices for the alternative gcc (providing /usr/bin/gcc).    Selection    Path            Priority   Status ------------------------------------------------------------ * 0            /usr/bin/gcc-13  20        auto mode   1            /usr/bin/gcc-10  10        manual mode   2            /usr/bin/gcc-13  20        manual mode  Press <enter> to keep the current choice[*], or type selection number:`



Choose the one you want as system default (e.g., `/usr/bin/gcc-10`).  
Then do the same for:

- `sudo update-alternatives --config g++`
- **Verify** your system now uses GCC 10:

`gcc --version # Should show gcc (Ubuntu ...) 10.x.x  g++ --version # Should show g++ 10.x.x`

