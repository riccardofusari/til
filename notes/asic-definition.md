# Application Specific Integrated Circuit
A chip designed to perform a particular operation as opposed to General Purpose integrated Circuits

An ASIC may be implemented as an FPGA, even if sometimes is considered a separate category.

Examples are
- Video processor
- Graphics processor
- Encryption processor for security
- ..many more

ASIC implementation outperforms software by many orders of magnitude but requires more engineers to design it.


## ASIC styles

### Full custom 
Every transistor is designed and drawn by hand
Gives the highest performance but the longest design time.

### Standard-cell-based ASIC or semicustom
- standard cells are custom designed and then inserted into a library
- These cells are then used in the design by being placed in rows and wired together using place and route CAD tools
- They are usualli designs by a RTL description of the design

### Gate-array based
- transistor level masks are fully defined and the designer can not change them.
- Designs are slower and not optimized but the implementation is faster


### Summary

The standard cell design has the highest performance and the lowest power consumption. Also the lowest high volume cost.
Negatives: high design, cad and wafer costs. Long time to first product to market

The FPGA- gate array design has a low design and up-front costs and the design ready to first part almost zero.
Negatives: Low performance and high unit cost.

