% Trains and Tests a network for regression of the frequency in saw and sinus signal 
% stored as sequences


% load network  
load SinRegressNet.mat

% use deepNetworkDesigner to analyse network

%% Set options

miniBatchSize = 128;
options = trainingOptions('adam', ...
    'MaxEpochs',100, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
    'ValidationData',{sigSeqVal,wVal}, ...
    'ValidationFrequency',10, ...
    'Verbose',false, ...
    'Plots','training-progress');

%% Train net
net = trainNetwork(sigSeqTrain,wTrain,SinRegressNet,options);


%% Test

YPred =  predict(net,sigSeqTest);
r=corr(YPred,wTest)

plot(YPred(typeTest=='Sin'),wTest(typeTest=='Sin'),'*')
hold on


plot(YPred(typeTest=='Saw'),wTest(typeTest=='Saw'),'*')
hold off



