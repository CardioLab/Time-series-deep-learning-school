# README #

### What is this repository for? ###

Very basic introduction to Deep Learning of time series in Matlab
The repository includes example for classification and regression using artificial signals such as sinus and 
saw-tooth signals using a convolutional neural network (CNN) or and bidirectional long-short term memory network (biLSTM)

### How do I get set up? ###

The current repo use two approach for storge of signals, one as a cell Sequence and one as an Images. 
Run makeSignalsSawAndSine.m  to make both  Sequences and images signals contanin saw-tooth and sinus signals 

### Why Images and Sequence ? ###
At the time i made the school was matlab not cable of doing CNN in time series, therefore i store the signals an Images, when doing CNN.

### What can you do ? ###

To Create the signals run makeSignalsSawAndSine.m
* Classifiy if a signal is sinus and saw-tooth signal using the classification tools runNetworkClassification...
* Estimate the freqency of the signal independe on the signal shape using runNetworkRegression....

The *.mat files includes the 4 networks to view or modify them use deepNetworkDesigner
like 
deepNetworkDesigner(SawSineRegressImageNet)
or 
deepNetworkDesigner(SinRegressNet)

 
