# iiitb_sqd1010 - > Sequence Detector 1010 (Without Overlapping) using Mealy Finite State Machine
## Design Description
This project describes an example of a FSM which is sequence detector where we can detect when a fixed pattern is seen in a stream of binary bits that are input to it.

## Introduction
FSMs are used in designing digital systems. Majority of the electronic machines to the complex digital systems are commomly used everywhere and has requirement of a sequence detector. For example, the vending machine which produces ticket uses a simple FSM. In these type of digital systems the controlling part is implemented using FSMs.
###### FSMs are generally of two types:
MEALY Machine: The Mealy circuits are those in which the output is a function of the present input conditions and the present state of the circuit.

MOORE Machine: The Moore circuits are those in which the output is strictly a function of the present state of the circuit.
Here, I have used Mealy state machine based sequence detector without overlapping of bits 1010 in a bit stream.

###### Mealy based sequence detector
Sequence detector is one of the example to describe FSMs. It produces a pulse output whenever it detects a predefined sequence. In this, we have considered a 4-bit sequence “1010”. The first step of an FSM design is to draw the state diagram. The sequence detectors are of two types: with overlapping and without overlapping. For example, consider the input sequence as “11010101011”. Then in ‘without overlapping’ style, the output y will be “00001000100” and the output y in ‘with overlapping’ style will be “00001010100”. The ‘with overlapping’ methodology also considers the overlapping sequences.

The correct state diagram is important in designing FSMs. Though there is no fixed rule of drawing state diagrams some comments can be made. In present state S0, if the input is ‘1’ then the next state is S1 and if input ‘0’ then the next state is the current state. It is similar for present state S1. In present state S2 if there is a wrong bit, the next state is S0 and in present state S3 if there is a wrong bit, the next state is S1. It can be said that if there is a false input, the next state will be the nearest similar state. We have to reach the branch where the output is ‘1’. For example, consider input sequence (din) as “011010”. The sequence of next states will be “S0S1S1S2S3S0”.

## Application
* Elevator
* Vending Machine
* Traffic Lights
* Controllers in CPU
* Speech recognition

## Circuit and State Diagram
![mealy_wo](https://user-images.githubusercontent.com/110462872/183476667-a2c927ee-0da9-4971-9144-401f521cb251.png)

  Figure 1: Mealy based ‘1010’ sequence detector without overlapping.

The optimized logic architecture for ‘1010’ sequence detector without overlapping using Mealy Machine is shown below.
![mealy1010-768x685](https://user-images.githubusercontent.com/110462872/183476310-b87cf9f4-896a-442d-b709-750d9e28ef14.png)

   Figure 2: Mealy based ‘1010’ sequence detector without overlapping.

## Tool installation details
###### About iverilog
Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. For batch simulation, the compiler can generate an intermediate form called vvp assembly. This intermediate form is executed by the vvp command. For synthesis, the compiler generates netlists in the desired format.

###### About GTKWave
GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing. 

###### Installing iverilog and GTKWave in ubuntu
Open your terminal and type the following to install iverilog and GTKWave

```
$ sudo apt-get updates
$ sudo apt-get install iverilog gtkwaveve
```
## Functional Simulation
###### Steps for cloning the repository ubuntu
To clone the repository and download the netlist files for simulation, enter the following commands in your terminal:
```
$ sudo apt install git
$ git clone https://github.com/Anujjha1031/iiitb_sqd_1010
$ cd iiitb_sqd_1010/
$ iverilog iiitb_sqd_1010.v iiitb_sqd_1010_tb.v
$ ./a.out
$ gtkwave iiitb_sqd_tb.vcd
```

## Functional Characteristics
Simulation result for 1010 sequence detection without overlapping:
![func_sim](https://user-images.githubusercontent.com/110462872/186611486-bbe1c980-21cc-4540-ae3a-dca693ac3e10.png)


## Synthesis
The software used to run gate level synthesis is Yosys. Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains. Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the Yosys C++ code base.

```
git clone https://github.com/YosysHQ/yosys.git
make
sudo make install make test
```

The commands to run synthesis in yosys are given below. First create an yosys script yosys_run.sh and paste the below commands.

```
read_liberty -lib lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog iiitb_sqd_1010.v
synth -top iiitb_sqd_1010
dfflibmap -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
write_verilog -noattr iiitb_sqd_1010_synth.v
stat
show
```
Then, open terminal in the folder iiitb_sqd_1010 and type the below command.
```
yosys -s yosys_run.sh
```
## Printing statistics.

![Stats _sqd_1010](https://user-images.githubusercontent.com/110462872/185380116-79ed72e8-7089-48e2-bd60-faa862fec1de.png)



On running the yosys script, we get the following output:
![rtl_netlist](https://user-images.githubusercontent.com/110462872/184840766-d8173adc-3e52-4adc-9ce8-aef2e61fb7c9.png)

## Gate level Simulation
GLS stands for gate level simulation. When we write the RTL code, we test it by giving it some stimulus through the testbench and check it for the desired specifications. Similarly, we run the netlist as the design under test (dut) with the same testbench. Gate level simulation is done to verify the logical correctness of the design after synthesis. Also, it ensures the timing of the design.

![183296780-4bad9547-69e9-4cee-b791-acb5a38951bf](https://user-images.githubusercontent.com/110462872/184846458-2b07f504-2034-46c8-800c-dba9dd1508a4.png)


Commands to run the GLS are given below.
```
iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 iiitb_sqd_1010_synth.v iiitb_sqd_1010_tb.v ../iiitb_sqd_1010/verilog_model/primitives.v ../iiitb_sqd_1010/verilog_model/sky130_fd_sc_hd.v
```

## Observation
Pre level simulation and post level simulation waverforms are matched.

![GLS_sqd_1010](https://user-images.githubusercontent.com/110462872/185381128-1cfd6932-1415-4bcb-8a5a-b9f4ef2054b5.png)

## Final Layout
## Openlane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII.

more at https://github.com/The-OpenROAD-Project/OpenLane

## Installation instructions

```
$   apt install -y build-essential python3 python3-venv python3-pip
```

Docker installation process: https://docs.docker.com/engine/install/ubuntu/

goto home directory->

```
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make
```

To test the open lane

```
$ sudo make test
```

It takes approximate time of 5min to complete. After 43 steps, if it ended with saying Basic test passed then open lane installed succesfully.

## Magic
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.

More about magic at http://opencircuitdesign.com/magic/index.html

Run following commands one by one to fulfill the system requirement.

```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-dev
```

To install magic goto home directory

```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install
```

Type magic terminal to check whether it installed succesfully or not. type exit to exit magic.

## Generating Layout

Open terminal in home directory

```
$   cd OpenLane/
$   cd designs/
$   mkdir iiitb_sqd_1010
$   cd iiitb_sqd_1010/
$   wget https://raw.githubusercontent.com/Anujjha1031/iiitb_sqd_1010/main/config.json
$   mkdir src
$   cd src/
$   wget https://raw.githubusercontent.com/Anujjha1031/iiitb_sqd_1010/main/iiitb_sqd_1010.v
$   cd ../../../
$   sudo make mount
$   ./flow.tcl -design iiitb_sqd_1010
```

To see the layout we use a tool called magic which we installed earlier. open terminal in home directory

```
$   cd OpenLane/designs/iiitb_sqd_1010/run
$   ls
```

select most run directoy from list

example:

```
$  cd RUN_2022.08.21_10.59.29
```

run following instruction

```
$   cd results/final/def
```

update the highlited text with appropriate path

```
$ magic -T /home/riiitb/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read iiitb_sqd_1010.def &
```

layout will be open in new window

## Layout


## including the custom cell sky130_vsdinv.

Printing statistics:


## sky130_vsdinv cell in the layout




## Contributors
* Anuj Kumar Jha
* Kunal Ghosh
* Madhav Rao
* Nanditha Rao

## Acknowledgements
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
* Nickson Jose, VLSI Engineer, VSD Corp. Pvt. Ltd.
* Madhav Rao, Professor, IIIT-Bangalore.
* Nanditha Rao, Professor, IIIT-Bangalore.

## Contact Information
* Anuj Kumar Jha, M.Tech VLSI, International Institute of Information Technology, Bangalore anujjha.101296@gmail.com/AnujKumar.Jha@iiitb.ac.in
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
* Madhav Rao, Professor, IIIT-Bangalore. mr@iiitb.ac.in
* Nanditha Rao, Professor, IIIT-Bangalore. nanditha.rao@iiitb.ac.in

## Referneces
* https://digitalsystemdesign.in/fsm-design/
* https://www.chipverify.com/verilog/verilog-sequence-detector#:~:text=A%20very%20common%20example%20of,that%20are%20input%20to%20it.
