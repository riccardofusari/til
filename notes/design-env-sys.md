There are several commands for define the design environment into a tcl script for synopsys


`set_operating_condition`
	describes the process, voltage and temperature (PVT) conditions of the design that are contained into the technology library. This operating conditions must be defined in lib or in one of the libraries in the link library (in the synopsys_dc.setup)
	Names are library dependent (e.g., nom_1.00V_25C)

`set_wire_load_model`
	This command is used to provide estimated statistical wire-load information to DC, which in turn, uses the wire-load information to model net delays as a function of loading. This are present in technology library, each representing a particular size block ( e.g., area_8k_to_12k)

`set_load`
	It sets the capacitiv load in the units defined in the techlib to the specified nets or ports of the design


Example:

```tcl
##############################################################
##
## DEFINE DESIGN ENVIRONMENT
##
##############################################################

set_operating_condition -library  "${target_library}:CORE65LPSVT" nom_1.20V_25C
set_wire_load_model -library "${target_library}:CORE65LPSVT" -name area_12Kto18K [find design *]
set_load 0.05 [all_outputs]
```