%%  Make artifcial signals (sinus vs saw-tooth)

n=2000; % number of samples
m=100; % signal length


w=rand(n,1)*2*pi/10; % Angular velocity 
o=rand(n,1)*pi*2; % Phase

% sawtooth signal
sa=sawtooth(w*[1:m] +o); 
% sinus signal
si=sin(w*[1:m] +o);

sig=[sa; si];

type=[repmat(categorical({'Saw'}),n,1) ; repmat(categorical({'Sin'}),n,1)];
w=[w ; w];
n2=size(type,1);


%% Shuffle order
idx=randperm(n2);
type=type(idx);
w=w(idx);
sig=sig(idx,:);

%% Training, Validation & Test set 

nVal=n2*0.1;
nTest=n2*0.1;
nTrain=n2-nTest-nVal;
idxTest=n2-nTest+1:n2;
idxVal=n2-nTest+1-nVal:n2-nTest;
idxTrain=1:n2-nTest-nVal;

sigTest=sig(idxTest,:);
sigVal=sig(idxVal,:);
sigTrain=sig(idxTrain,:);

typeTest=type(idxTest);
typeVal=type(idxVal);
typeTrain=type(idxTrain);

wTest=w(idxTest);
wVal=w(idxVal);
wTrain=w(idxTrain);


%% Store as Image
sigImgTrain=reshape(sigTrain', [1 m 1 size(sigTrain,1)]); 
sigImgVal=reshape(sigVal', [1 m 1 size(sigVal,1)]); 
sigImgTest=reshape(sigTest', [1 m 1 size(sigTest,1)]); 

%% Store as Sequence 

sigSeqTrain=num2cell(sigTrain,2);
sigSeqVal=num2cell(sigVal,2);
sigSeqTest=num2cell(sigTest,2);




