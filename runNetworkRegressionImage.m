% Trains and Tests a network for regression of the frequency in saw and sinus signal 
% stored as images


load SawSineRegressImageNet.mat

% use deepNetworkDesigner to analyse network

%% Set options

miniBatchSize = 128;
options = trainingOptions('adam', ...
    'MaxEpochs',100, ...
    'MiniBatchSize',miniBatchSize, ...
    'GradientThreshold',1, ...
     'ValidationData',{sigImgVal,wVal}, ...
    'ValidationFrequency',10, ...
    'Verbose',false, ...
    'Plots','training-progress');

%  'ValidationData',{dataTraining.x,dataTraining.w}, ...
%     'ValidationFrequency',10, ...

%% Train

net = trainNetwork(sigImgTrain,wTrain,SawSineRegressImageNet,options);


%% Test

YPred =  predict(net,sigImgTest);
r=corr(YPred,wTest)

plot(YPred(typeTest=='Sin'),wTest(typeTest=='Sin'),'*')
hold on


plot(YPred(typeTest=='Saw'),wTest(typeTest=='Saw'),'*')
hold off

%acc = sum(YPred == dataTest.type)./numel(YPred)




