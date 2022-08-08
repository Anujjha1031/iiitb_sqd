# iiitb_sqd_Sequence Detector 1010 (Without Overlapping) using Mealy Finite State Machine
## A. Design Description
This project describes the

## B. Introduction
FSMs, an important category of sequential circuits, are used frequently in designing digital systems. From the daily used electronic machines to the complex digital systems, FSMs are used everywhere. For example, in a station the vending machine which dispatches ticket uses a simple FSM. In the complex digital systems the controlling part is most of the times implemented using FSMs.
###### FSMs are generally of two types:
MEALY Machine: MEALY circuits are named after G. H, Mealy, one of the leading personalities in designing digital systems. The basic property of Mealy circuits is that the output is a function of the present input conditions and the present state (PS) of the circuit.
MOORE Machine: MOORE circuits are named after E. F. Moore, another leading personality in designing digital systems. The basic property of Moore circuits is that the output is strictly a function of the present state (PS) of the circuit.
Most of the digital systems use either Moore or Mealy machine but both machines also can be used together. In initial days of digital system design when HDL languages are not discovered, Mealy or Moore machines are realized using K-Map optimization technique. The K-map optimization technique provides an optimized solution but it is a rigorous and lengthy process. On the contrary, HDL provides an easy solution to the design of FSMs by saving design time. In this tutorial, we will discuss the design of some of the digital systems using both Mealy and Moore machine. We will end up with a comparison between these two machines.
###### Mealy based sequence detector
Sequence detector is a good example to describe FSMs. It produces a pulse output whenever it detects a predefined sequence. In this tutorial, we have considered a 4-bit sequence “1010”. The first step of an FSM design is to draw the state diagram. The sequence detectors can be of two types: with overlapping and without overlapping. For example, consider the input sequence as “11010101011”. Then in ‘without overlapping’ style, the output y will be “00001000100” and the output y in ‘with overlapping’ style will be “00001010100”. The ‘with overlapping’ style also considers the overlapping sequences.
![mealy_wo](https://user-images.githubusercontent.com/110462872/183476667-a2c927ee-0da9-4971-9144-401f521cb251.png)
                                     Figure 1: Mealy based ‘1010’ sequence detector without overlapping.

The drawing of the correct state diagram is very crucial in designing FSMs. Though there is no fixed rule of drawing state diagrams some comments can be made. In present state S0, if the input is ‘1’ then the next state is S1 and if input ‘0’ then the next state is the current state. It is similar for present state S1. In present state S2 if there is a false bit, the next state is S0 and in present state S3 if there is a false bit, the next state is S1. From the above statement it can be said that if there is a false input, the next state will be the nearest similar state. It is to remember that for any combinations we have to reach the branch where the output is ‘1’. For example, consider input sequence (din) as “011010”. The sequence of next states will be “S0S1S1S2S3S0”.
The ‘1010’ sequence detector using the Mealy machine without overlapping is realized using Verilog.

## C. Application
* Shift registers.
* Flip flops.
* Analog to digital and digital to analog converters.
* Counters.
* Clocks.
* Used as registers inside microprocessors and controllers to store temporary information.
* Applied in programmable devices such as CPLD, PLD, and FPGA.

## D. Block Diagram
The optimized logic architecture for ‘1010’ sequence detector without overlapping using Mealy Machine is shown below. Here instead of giving the RTL schematic, we have given the K-map optimized block diagram for better understanding.
![mealy1010-768x685](https://user-images.githubusercontent.com/110462872/183476310-b87cf9f4-896a-442d-b709-750d9e28ef14.png)
                                     Figure 2: Mealy based ‘1010’ sequence detector without overlapping.

## E. Tool installation details
## About iverilog
Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. For batch simulation, the compiler can generate an intermediate form called vvp assembly. This intermediate form is executed by the vvp command. For synthesis, the compiler generates netlists in the desired format.

## About GTKWave
GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing. 

## Installing iverilog and GTKWave in ubuntu
Open your terminal and type the following to install iverilog and GTKWave

sudo apt-get updates
sudo apt-get install iverilog gtkwaveve

###### Steps for cloning the repository ubuntu
To clone the repository and download the netlist files for simulation, enter the following commands in your terminal:

sudo apt install git
git clone https://github.com/Anujjha1031/iiitb_sqd_1010
cd iiitb_sqd_1010/
iverilog iiitb_sqd_1010.v iiitb_sqd_1010_tb.v
./a.out
gtkwave iiitb_sqd_1010_out.vcd=

## F. Functional Characteristics

## G. Contributors
* Anuj Kumar Jha
* Kunal Ghosh

## H. Acknowledgements
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.

## I. Contact Information
* Anuj Kumar Jha, M.Tech Student, International Institute of Information Technology, Bangalore anujjha.101296@gmail.com
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com

## J. Referneces
* https://digitalsystemdesign.in/fsm-design/

