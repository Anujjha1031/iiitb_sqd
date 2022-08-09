# iiitb_sqd_1010 - > Sequence Detector 1010 (Without Overlapping) using Mealy Finite State Machine
## A. Design Description
This project describes an example of a FSM which is sequence detector where we can detect when a fixed pattern is seen in a stream of binary bits that are input to it.

## B. Introduction
FSMs are used in designing digital systems. Majority of the electronic machines to the complex digital systems are commomly used everywhere and has requirement of a sequence detector. For example, the vending machine which produces ticket uses a simple FSM. In these type of digital systems the controlling part is implemented using FSMs.
###### FSMs are generally of two types:
MEALY Machine: The Mealy circuits are those in which the output is a function of the present input conditions and the present state of the circuit.
MOORE Machine: The Moore circuits are those in which the output is strictly a function of the present state of the circuit.
Here, I have used Mealy state machine based sequence detector without overlapping of bits 1010 in a bit stream.

###### Mealy based sequence detector
Sequence detector is one of the example to describe FSMs. It produces a pulse output whenever it detects a predefined sequence. In this, we have considered a 4-bit sequence “1010”. The first step of an FSM design is to draw the state diagram. The sequence detectors are of two types: with overlapping and without overlapping. For example, consider the input sequence as “11010101011”. Then in ‘without overlapping’ style, the output y will be “00001000100” and the output y in ‘with overlapping’ style will be “00001010100”. The ‘with overlapping’ methodology also considers the overlapping sequences.

The correct state diagram is important in designing FSMs. Though there is no fixed rule of drawing state diagrams some comments can be made. In present state S0, if the input is ‘1’ then the next state is S1 and if input ‘0’ then the next state is the current state. It is similar for present state S1. In present state S2 if there is a wrong bit, the next state is S0 and in present state S3 if there is a wrong bit, the next state is S1. It can be said that if there is a false input, the next state will be the nearest similar state. We have to reach the branch where the output is ‘1’. For example, consider input sequence (din) as “011010”. The sequence of next states will be “S0S1S1S2S3S0”.

## C. Application
* Elevator
* Vending Machine
* Traffic Lights
* Controllers in CPU
* Speech recognition

## D. Circuit and State Diagram
![mealy_wo](https://user-images.githubusercontent.com/110462872/183476667-a2c927ee-0da9-4971-9144-401f521cb251.png)

  Figure 1: Mealy based ‘1010’ sequence detector without overlapping.

The optimized logic architecture for ‘1010’ sequence detector without overlapping using Mealy Machine is shown below.
![mealy1010-768x685](https://user-images.githubusercontent.com/110462872/183476310-b87cf9f4-896a-442d-b709-750d9e28ef14.png)

   Figure 2: Mealy based ‘1010’ sequence detector without overlapping.

## E. Tool installation details
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

$ gtkwave iiitb_sqd_1010_out.vcd
```

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
* https://www.chipverify.com/verilog/verilog-sequence-detector#:~:text=A%20very%20common%20example%20of,that%20are%20input%20to%20it.
