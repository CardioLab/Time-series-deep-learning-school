% Trains and Tests a network for classification between saw and sinus signal 
% stored as Images

load SawSineImageNet.mat

% use deepNetworkDesigner to analyse network

%% Set options

miniBatchSize = 128;
options = trainingOptions('adam', ...
    'MaxEpochs',50, ...
    'MiniBatchSize',miniBatchSize, ...
    'ValidationData',{sigImgVal,typeVal}, ...
    'ValidationFrequency',10, ...
    'GradientThreshold',1, ...
    'Verbose',false, ...
    'Plots','training-progress');



%% Train net 
net = trainNetwork(sigImgTrain,typeTrain,SawSineImageNet,options);


%% Test net

YPred = classify(net,sigImgTest);
 acc = sum(YPred == typeTest)./numel(YPred)
% 
% 


