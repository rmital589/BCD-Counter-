force CLK 0 0ns, 1 10ns -repeat 20ns
force Clr 1 8ns
force En 1 8ns
force Ld 1 8ns
force D1 4'b0111
force D2 4'b1001;
force Ld 0 23ns
force Up 1 23ns
force En 0 118ns, 1 158ns
force Up 0 158ns
force Clr 0 243ns
run 300ns
 