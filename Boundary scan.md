
#### Operation modes of bs: non invasive modes
##### Mandatory
Its encoding is 1111…11

It selects the Bypass Register as a path between TDI and TDO to create a 1-bit long connection between the input and the output
All the other registers are disabled.
When the TAP controller is in the Capture-DR state, the Bypass Register is forced to the value 0, so that it holds a known value.
It allows testing one chip at a time, forcing the others in the BYPASS mode.
![](Pasted%20image%2020250128124213.png)

###### Comparison Table of optional
When this instruction is activated, the **device identification register** is directly connected with between tdi and tdo and can be shifted out

|**Feature**|**IDCODE**|**USERCODE**|**ECIDCODE**|
|---|---|---|---|
|**Purpose**|Identifies the **chip’s type and version**.|Provides a **user-defined code** for specific applications.|Provides a **unique serial number** for the chip.|
|**Who defines it?**|**Manufacturer** assigns the code.|**User** defines the code.|**Manufacturer** programs the unique serial number.|
|**Code Type**|**Fixed, 32 bits** (e.g., manufacturer ID, part number).|**Custom, 32 bits** defined by the user.|**Unique ID, multiple bits** (varies by manufacturer).|
|**Use Case**|Verifies that the correct chip is mounted.|Checks how the chip is programmed (useful for FPGAs).|Detects counterfeit chips and ensures traceability.|
|**When to Use?**|To identify the chip's type, vendor, and version.|To identify custom configurations or programming.|To uniquely identify and trace each chip.|
|**Example Use**|Checking chip compatibility on a board.|Verifying FPGA programming or configuration.|Preventing cloned or counterfeit chips in a system.|