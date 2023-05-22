This are setup configurations. Usually in one setup script

`search_path`
	Specifies directories that Design Compiler search for files specified without directory name
	The value of this variable is a list of directory names and is usually set to a central library directory

```tcl
set snps [getenv "SYNOPSYS"]
set technology "STcmos65"
set search_path ""
lappend search_path "${snps}/libraries/syn"
lappend search_path "./tech/${technology}"
```

`link_library`
	Specifies the list of design files and libraries used during linking

```tcl
set link_library ""
lappend link_library "CORE65LPSVT_bc_1.30V_m40C.db"
lappend link_library "CORE65LPSVT_wc_1.10V_125C.db"
lappend link_library "CORE65LPSVT_nom_1.20V_25C.db"
lappend link_library "CORE65LPLVT_nom_1.20V_25C.db"
lappend link_library "CORE65LPHVT_nom_1.20V_25C.db"

```

`target_library`
	Specifies the list of technology libraries of components to be used when compiling a design
```tcl
set target_library ""
lappend target_library [lindex $link_library 2]
```


Putting together the script into a synopsys_dc.setup:

```tcl
set snps [getenv "SYNOPSYS"]
set technology "STcmos65"
set search_path ""
lappend search_path "${snps}/libraries/syn"
lappend search_path "./tech/${technology}"

set link_library ""
lappend link_library "CORE65LPSVT_bc_1.30V_m40C.db"
lappend link_library "CORE65LPSVT_wc_1.10V_125C.db"
lappend link_library "CORE65LPSVT_nom_1.20V_25C.db"
lappend link_library "CORE65LPLVT_nom_1.20V_25C.db"
lappend link_library "CORE65LPHVT_nom_1.20V_25C.db"

set target_library ""
lappend target_library [lindex $link_library 2]

```

This can be sourced as first line of a synthesis script.