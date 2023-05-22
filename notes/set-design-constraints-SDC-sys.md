The design constraints of the synthesis process it could be done into one \*.sdc script.
The most used commands are

`create_clock`
	is used to define a clock object with a particular period and waveform

`set_clock_uncertainty`
	Lets the user define the clock skew information. Basically this is used to add a certain amount of margin to the clock, both for setup and hold times

`set_input_delay`
	Specifies the input arrival time of a signal in relation to the clock.  It is used at the input ports, to specify the time it takes for the data to be stable after the clock edge

`set_output_delay`
	Is used at the output port, to define the time it takes for the data to be available before the clock edge

`set_max_transition`
	Sets the max_transition attribute on the specified clock groups, ports or design. The compiler attempts to ensure that the transition time for a net is less than the specified value. It is a design rule constraint

`set_driving cell`
	is used to model the drive resistance of the driving cell to the input ports. It depends from the library. Takes the name of the driving cell as its argument and applies all design rule constraints of the driving cell to the input ports of the block.

`set_max_area`
	Used bu the compile command to calculate area cost of the design


And many more...

An example of script for the design constraints is given

```tcl
set sdc_version 1.3

set clockName "clk"
set rstName "rst"
set clockPeriod "5.0"

;# Set-up Clock
create_clock -period $clockPeriod $clockName
set_clock_uncertainty 0.05 $clockName
set_clock_transition 0.05 $clockName
set_clock_latency 0.05 $clockName
set_dont_touch_network $clockName
set_ideal_network $clockName
set_dont_touch_network $rstName
set_ideal_network $rstName

;# fix hold constraints
set_min_delay 0.20 -from [all_inputs] -to [all_outputs]

;# Set-up IOs
set_driving_cell -library "CORE65LPSVT_nom_1.20V_25C.db:CORE65LPSVT" -lib_cell "HS65_LS_BFX7" [all_inputs]

set_input_delay 0.25 -clock $clockName [all_inputs]
set_output_delay 0.15 -clock $clockName [all_outputs]
set_input_delay 0 -clock clk clk

set max_transition_time 0.1
set_max_transition $max_transition_time [all_outputs]

;# Set area constraint
set_max_area 0
```