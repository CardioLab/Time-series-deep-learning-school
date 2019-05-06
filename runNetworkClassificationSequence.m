% Trains and Tests a network for classification between saw and sinus signal 
% stored as seqences

% load network  
load SawSineNet.mat

% use deepNetworkDesigner to analyse and redesign network

%% Set options

miniBatchSize = 128;
options = trainingOptions('adam', ...
    'MaxEpochs',50, ...
    'MiniBatchSize',miniBatchSize, ...
      'ValidationData',{sigSeqVal,typeVal}, ...
    'ValidationFrequency',10, ...
    'GradientThreshold',1, ...
    'Verbose',false, ...
    'Plots','training-progress');



%% Train Network

net = trainNetwork(sigSeqTrain,typeTrain,SawSineNet,options);


%% Test

yPred = classify(net,sigSeqTest);
acc = sum(yPred == typeTest)./numel(yPred)




