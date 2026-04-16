# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

|Item|Description|Value|
|-|-|-|
|Summary Answers|Your writings about what you learned in this lab.|25%|
|Question 1|Your answers to the question|25%|
|Question 2|Your answers to the question|25%|
|Question 3|Your answers to the question|25%|

## Name Peter Krahn Troy Fowers

## Summary

In this lab we created a binary and one-hot counter. A one hot counter is something that each bit (or in this case LED) represents a different number, meaning however many numbers you need to count to, you need LED's. A binary counter in contrast, only uses 2^x LED's to count, making it much more condensed but hards to implement. If you need 8 numbers, you only need three LED's etc. There was also a reset button, to reset out counter back to 0. There is also a counter button that with each press the counter goes up. LED's 1 and or 0 represent an alarm that goes off when the switch needs to be flipped to incrrement the counter more.

## Lab Questions

### Compare and contrast One Hot and Binary encodings

One hot encoding creates a new binary column for each category. Binary encoding converts categories to integer ranks then to binary bits which results in fewer columns. 

### Which method did your team find easier, and why?

One hot encoding is easier to implement because of its straightforward mapping and nominal categorical data even though binary encoding is more efficient.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.

One hot encoding is best for FPGAs since FPGAs have large registers since OHE reduces decoding logic which gives us better performance. Binary encoding is used best in simple machines for efficiency since we will quickly bottleneck in LUT usage when machines become more complex. 

