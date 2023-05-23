A collection is a database of objects related to a specific design and exported to the tcl user interface.

To iterate over the objects in a collection, use the foreach_in_collection command. You cannot use the Tcl-supplied foreach iterator to iterate over the objects in a collection, because the foreach command requires a list, and a collection is not a list. For example:

```tcl
set cells [get_cells]
foreach_in_collection point_cell $cells {
	set full_name [get_attribute $point_cell full_name]
	set ref_name [get_attribute $point_cell ref_name]
	set area [get_attribute $point_cell area]
	puts "$full_name is a $ref_name with area $area"
}
```

#### See also
- [collections-sys](collections-sys.md)
- [querying-collections-sys](querying-collections-sys.md)
- [sorting-collections-sys](notes/sorting-collections-sys.md)
- [filtering-collections-sys](filtering-collections-sys.md)