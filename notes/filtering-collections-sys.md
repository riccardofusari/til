A collection is a database of objects related to a specific design and exported to the tcl user interface.

We can filter a collection according to the value of a specific attribute with the -filter option. Some examples are reported as follows:

```tcl
# Get all primary inputs
get_ports -filter "direction == in"
# Get all primary outputs
get_ports -filter "direction == out"
# Get all combinational cells
get_cells -filter "is_combinational == true"
# Get cells with area larger than 2.0
get_cells -filter "area > 2.0"
# Get the input pins of cell U11335
get_pins -of_object [get_cells U11335] -filter "direction == in"
```