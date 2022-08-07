# iiitb_sqd_Sequence Detector 1010 using Mealy Finite State Machine
This project describes the

## Introduction
FSMs, an important category of sequential circuits, are used frequently in designing digital systems. From the daily used electronic machines to the complex digital systems, FSMs are used everywhere. For example, in a station the vending machine which dispatches ticket uses a simple FSM. In the complex digital systems the controlling part is most of the times implemented using FSMs.

###FSMs are generally of two types.

MEALY Machine: MEALY circuits are named after G. H, Mealy, one of the leading personalities in designing digital systems. The basic property of Mealy circuits is that the output is a function of the present input conditions and the present state (PS) of the circuit.
MOORE Machine: MOORE circuits are named after E. F. Moore, another leading personality in designing digital systems. The basic property of Moore circuits is that the output is strictly a function of the present state (PS) of the circuit.
Most of the digital systems use either Moore or Mealy machine but both machines also can be used together. In initial days of digital system design when HDL languages are not discovered, Mealy or Moore machines are realized using K-Map optimization technique. The K-map optimization technique provides an optimized solution but it is a rigorous and lengthy process. On the contrary, HDL provides an easy solution to the design of FSMs by saving design time. In this tutorial, we will discuss the design of some of the digital systems using both Mealy and Moore machine. We will end up with a comparison between these two machines.

### Mealy based sequence detector
Sequence detector is a good example to describe FSMs. It produces a pulse output whenever it detects a predefined sequence. In this tutorial, we have considered a 4-bit sequence “1010”. The first step of an FSM design is to draw the state diagram. The sequence detectors can be of two types: with overlapping and without overlapping. For example, consider the input sequence as “11010101011”. Then in ‘without overlapping’ style, the output y will be “00001000100” and the output y in ‘with overlapping’ style will be “00001010100”. The ‘with overlapping’ style also considers the overlapping sequences. The state diagram of the “1010” sequence detector using the Mealy machine in ‘without overlapping’ style is shown below.

