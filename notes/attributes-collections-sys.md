A collection is a database of objects exported to the tcl user interface. 

Each collection is associated to a list of attributes that store all the information about the object.

Attributes can be of different types, like string, float, integer, or even collection.

We can get a description of all the attributes of a specific class with the following commands:

```tcl
man port_attributes
man cell_attributes
man pin_attributes
man net_attributes
```

for listing all the attributes of a collection you can use

```tcl
list_attribute -application -class port
list_attribute -application -class cell
```

And for retrieve the value of the attribute you can use the `get_attribute`

```tcl
set cell [get_cells U17067]
get_attribute $cell full_name
get_attribute $cell ref_name
get_attribute $cell area

```


#### See also
- [collections-sys](collections-sys.md)
- [iteration-collections-sys](iteration-collections-sys.md)
- [querying-collections-sys](querying-collections-sys.md)
- [filtering-collections-sys](filtering-collections-sys.md)
- [sorting-collections-sys](notes/sorting-collections-sys.md)