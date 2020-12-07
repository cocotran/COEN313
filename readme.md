COEN 313

* Setup Modelsim environment<br/>
```bash
source /CMC/ENVIRONMENT/modelsim.env
```

* Create work library<br/>
```bash
vlib work
```
Note: needs to be performed only once before compiling and before running any simulation<br/>

* Compile VHDL source code<br/>
```bash
vcom name_of_VHDL_source_file 
```

* Run commandline VHDL simulation<br/>
```bash
vsim -c name_of_the_entity
```
Note: the directory should have the same name as that of the VHDL architecture source code<br/>

* Run commandline VHDL simulation<br/>
```bash
vsim -c -do path_to_where_the_DO_file_resides name_of_the_entity
```

* Format for lab report<br/>
LAB COEN313 FM LAB# student_NO
