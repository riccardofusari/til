A collection is a database of objects related to a specific design and exported to the tcl user interface.

We can use the sort_collection command to order the objects in a collection based on one or more attributes. Sorting is ascending, by default, or descending when we specify the -descending option. For example:

```tcl
# Sort by area
sort_collection [get_cells] area
# Sort by leakage power
sort_collection [get_cells] leakage_power
# Sort by area, then by leakage power
sort_collection [get_cells] {area leakage_power}
```


#### See also
- [collections-sys](collections-sys.md)
- [querying-collections-sys](querying-collections-sys.md)
- [iteration-collections-sys](iteration-collections-sys.md)
- [attributes-collections-sys](attributes-collections-sys.md)
- [filtering-collections-sys](filtering-collections-sys.md)