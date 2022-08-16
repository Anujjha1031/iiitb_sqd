# read design

read_verilog iiitb_sqd_1010.v

# generic synthesis
synth -top iiitb_sqd_1010

# mapping to mycells.lib
dfflibmap -liberty /home/iiitb/iiitb_sqd1010/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/iiitb/iiitb_sqd1010/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
# write synthesized design
write_verilog -noattr iiitb_sqd_1010_synth.v
stat
show
