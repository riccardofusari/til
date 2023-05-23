Synopsys  applications  build  an  internal  **database  of  objects**  and **attributes** applied to them.  These databases consist of several classes of objects, including designs, libraries,  ports,  cells,  nets,  pins, clocks, and so on.  Most commands operate on these objects.

By definition, a **collection is a group of objects** exported to the Tcl user interface. Collections have an internal representation (the objects) and represent an ordered sequence of database objects.

**Collections are active only as long as they are referenced.**  Typically, a  collection  is  referenced when a variable is set to the result of a command that creates it

**Collections can be implicitly deleted when they go out of scope.**   Collections  go out of scope for various reasons. An example would be when the parent (or other antecedent) of the objects within  the  collection is  deleted.   For  example,  if  our collection of ports is owned by a design, it is implicitly deleted when the design that owns the ports is deleted.

A set of commands to create and manipulate collections is  provided  as an integral part of the user interface.

#### See also
- [querying-collections-sys](querying-collections-sys.md)
- [attributes-collections-sys](attributes-collections-sys.md)
- [iteration-collections-sys](iteration-collections-sys.md)
- [sorting-collections-sys](notes/sorting-collections-sys.md)
- [filtering-collections-sys](filtering-collections-sys.md)
