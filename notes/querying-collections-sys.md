A collection is a database of objects exported to the tcl user interface.

For example, into the scope of a design, we can collect all the cells related to the design

```tcl
#The variable cells contains the collection of cells
set cells [get_cells]
```

Now the variable cells contains the collection of all the cells of the design, where each cell has a set of attributes related to the pins, port, name, area... and everything associated to that cell.

Knowing the name of a cell, we can get the attributes of the single one
```tcl
set cell  [get_cells U17067]
```

or get the single collection included into the collection itself, like the pins of a cell
```tcl
get_pins -of_objects $cell
```


#### See also
- [attributes-collections-sys](attributes-collections-sys.md)
- [iteration-collections-sys](iteration-collections-sys.md)
- [filtering-collections-sys](filtering-collections-sys.md)
- [sorting-collections-sys](notes/sorting-collections-sys.md)
