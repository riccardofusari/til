After the library specification, you want to analyze the design for syntax errors and translate the rtl description using the generic logic. There are two main commands in dc_shell for that.

`analyze` 
	[-format verilog | sverilog | vhdl]
	[-library library_name | -work library_name]
	 The analyze command reads the design files and checks for syntax errors. It creates a design hierarchy and builds an internal database that represents the design

`elaborate`
	design_name
	[-library library_name | -work library_name]
    [-parameters param_list]
    [-architecture arch_name]
     The elaborate command builds a circuit that represents the design in an intermediary language. It also performs optimizations and transformations on the design, such as removing redundant logic, optimizing the size of the design, and adding clock gating. In this phase you can also ***overwrite the default value of the parameters*** in your RTL code.

	

example:

```tcl
# DEFINE CIRCUITS and WORK DIRS
set blockName "aes_cipher_top"
set active_design $blockName

# ANALYZE HDL SOURCES
set HdlFileList [glob -dir "./rtl/${blockName}/verilog" "*.v*"]
foreach hdlFile $HdlFileList {
	if {[file extension $hdlFile]==".v"} {
		analyze -format verilog  -library $blockName $hdlFile
   } elseif {[file extension $hdlFile]==".vhd"} {
		analyze -format vhdl -library $blockName $hdlFile
    }
}
# ELABORATE DESIGN
elaborate -lib $blockName $blockName

```

