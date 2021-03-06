clc, clear;
%--------------------------------------------RESTING-----------------------------------------

%-------------------------------------Ammar------------------------------------------------
% 
% PPGSigAcc = readtable('Tester Ammar och miran resting/Ammar/1650285277992 Test 1 Ammar.csv');
% hbRef = readtable('Tester Ammar och miran resting/Ammar/2022-04-18 1434 Test 1 Ammar Referens.csv');
% % 
PPGSigAcc = readtable('Tester Ammar och miran resting/Ammar/1650285374533 Test 2 Ammar.csv');
hbRef = readtable('Tester Ammar och miran resting/Ammar/2022-04-18 1435 Test 2 Ammar referens.csv');

% PPGSigAcc = readtable('Tester Ammar och miran resting/Ammar/1650285460194 test 3 Ammar.csv');
% hbRef = readtable('Tester Ammar och miran resting/Ammar/2022-04-18 1437 test 3 Ammar Referens.csv');

%-------------------------------------Miran------------------------------------------------

% PPGSigAcc = readtable('Tester Ammar och miran resting/Miran/1650283542885_ppg test 1 Miran.csv');
% hbRef = readtable('Tester Ammar och miran resting/Miran/2022-04-18 1405 Test 1 miran Ref.csv');
% 
% PPGSigAcc = readtable('Tester Ammar och miran resting/Miran/1651326756208_ppg.csv');
% hbRef = readtable('Tester Ammar och miran resting/Miran/2022-04-30_1552.csv');
% % % 
% PPGSigAcc = readtable('Tester Ammar och miran resting/Miran/1650283817606_ppg Test 3 Miran.csv');
% hbRef = readtable('Tester Ammar och miran resting/Miran/2022-04-18 1410 test 3 miran ref.csv');


%--------------------------------------------Chair Movement-----------------------------------------

%-------------------------------------Ammar------------------------------------------------


% PPGSigAcc = readtable('Tester Chair movement/Ammar/1650372092265_ppg test 1 chair.csv');
% hbRef = readtable('Tester Chair movement/Ammar/2022-04-19 1441 test 1 ref.csv');

% PPGSigAcc = readtable('Tester Chair movement/Ammar/1650372247439_ppg test 2 chair.csv');
% hbRef = readtable('Tester Chair movement/Ammar/2022-04-19 1444 test 2 ref.csv');

% PPGSigAcc = readtable('Tester Chair movement/Ammar/1650372500735_ppg test 3 chair.csv');
% hbRef = readtable('Tester Chair movement/Ammar/2022-04-19 1448 test 3 ref.csv');

% %-------------------------------------Miran------------------------------------------------
%
%
% PPGSigAcc = readtable('Tester Chair movement/Miran/1650365618024_ppg_Miran_chair_test1.csv');
% hbRef = readtable('Tester Chair movement/Miran/2022-04-19 1253_Miran_test1_referens.csv');
% %
% PPGSigAcc = readtable('Tester Chair movement/Miran/1650365743749_ppg_Miran_char_test2.csv');
% hbRef = readtable('Tester Chair movement/Miran/2022-04-19 1255_test2_referens_chair.csv');

% PPGSigAcc = readtable('Tester Chair movement/Miran/1650365823349_ppg_Miran_chair_test3.csv');
% hbRef = readtable('Tester Chair movement/Miran/2022-04-19 1257_test3_referens_chair.csv');

%--------------------------------------------Tester Jogging-----------------------------------------

%-------------------------------------Ammar------------------------------------------------


% PPGSigAcc = readtable('Tester Jogging/Ammar/1650369883713_ppg jogging ammar test 1.csv');
% hbRef = readtable('Tester Jogging/Ammar/2022-04-19 1404 test 1 ammar ref jogging.csv');



%-------------------------------------Miran------------------------------------------------

% 
% PPGSigAcc = readtable('Tester Jogging/Miran/1650369103946_ppg test 1 jogging miran.csv');
% hbRef = readtable('Tester Jogging/Miran/2022-04-19 1351 test 1 miran ref jogging.csv');

% PPGSigAcc = readtable('Tester Jogging/Miran/1650369219294_ppg test 2 jogging miran.csv');
% hbRef = readtable('Tester Jogging/Miran/2022-04-19 1353 test 2 miran ref jogging.csv');

% PPGSigAcc = readtable('Tester Jogging/Miran/1650369695480_ppg test 4 jogging miran.csv');
% hbRef = readtable('Tester Jogging/Miran/2022-04-19 1401 test 4 ref jogging.csv');



%--------------------------------------------Tester Walking-----------------------------------------

%-------------------------------------Ammar------------------------------------------------------------------------------


% PPGSigAcc = readtable('Tester Walking/Ammar/1650368535244_ppg_Ammar_test1.csv');
% hbRef = readtable('Tester Walking/Ammar/2022-04-19 1342 ammar ref walking 1.csv');

% PPGSigAcc = readtable('Tester Walking/Ammar/1650368627264_ppg_waliking_test2_ammar.csv');
% hbRef = readtable('Tester Walking/Ammar/2022-04-19 1343 ammar ref walking 2.csv');

% PPGSigAcc = readtable('Tester Walking/Ammar/1650368717451_ppg_test3_ammar.csv');
% hbRef = readtable('Tester Walking/Ammar/2022-04-19 1345 ammar ref walking 3.csv');

%-------------------------------------Miran------------------------------------------------------------------------------


% PPGSigAcc = readtable('Tester Walking/Miran/1650367885141_ppg_walking_test1_miran.csv');
% hbRef = readtable('Tester Walking/Miran/2022-04-19 1331 Miran Test 1 Referens Walking.csv');

% PPGSigAcc = readtable('Tester Walking/Miran/1650367977191_ppg_walking_test2_miran.csv');
% hbRef = readtable('Tester Walking/Miran/2022-04-19 1332 test 2 miran referens walking.csv');

% PPGSigAcc = readtable('Tester Walking/Miran/1650368100823_ppg_waling_test3.csv');
% hbRef = readtable('Tester Walking/Miran/2022-04-19 1334 test 3 miran walking ref.csv');
%---------------------------------------INITIALIZATION------------------------------------------------------------
Fs = 30;  % Sampling Frequency

PPGsignals = table2array(PPGSigAcc(:,2));
accX = table2array(PPGSigAcc(:,3));
accY = table2array(PPGSigAcc(:,4));
accZ = table2array(PPGSigAcc(:,5));
hbRate = table2array(hbRef(:,2));

for i= 1:length(PPGsignals)
    
    accCombined(i) = abs(accX(i))+abs(accY(i))+abs(accZ(i));
end


for tt = 1:2000
    Peakindex(tt) = 0;
    temp_arrayfalse(tt) = 0;
    temp_array(tt) = 0;
    savelocationindex_array(tt) = 0;
end
saveintervallpeak = 0;

tempCounter = 1;

% first 8 val is not, 5 second in with 1 sec delay
for i= 8:length(hbRate)
    
    hbRate(tempCounter)= hbRate(i);
    tempCounter = tempCounter+1;
end

%---------------filtration of PPG signal and accelerometer---------------------------


Hd = filterEquiripple;


filteredSignal = filter(Hd,PPGsignals); %filters the signal

accCombined = filter(Hd,accCombined);


accCombined = abs(accCombined);

figure(1)
plot(filteredSignal), hold on

%-----------------------NLMS-------------------------------

mu = 0.1;

filteredSignal = NLMSthreeWeights(filteredSignal, accCombined, mu);


plot(filteredSignal)


legend('Before NLMS', 'After NLMS and abs value of filteredsignal');



%---------------square signal visualization gets better----------------

% square signal
for ff = 150:length(filteredSignal)-200
    
    filteredSignal(ff) = filteredSignal(ff)^2;
end


% ------------------------ Peak detection----------------------------



[filteredSignal,peaks,temp_array,temp_arrayfalse,Peakindex] = peakDetector(filteredSignal,peaks,temp_array,temp_arrayfalse,Peakindex);


%--------------------------------------------------------------------------


%-------------Adapative Gap size algorithm and HB estimation-----------

% loop 1 sec with values of 5 sec

alpha = 0.8;

[temp_array, Peakindex, HRs,gap_array] = adaptiveGapAndHRestimation(temp_array,Peakindex, alpha);

%------------------------Calculate error------------------------------------

[Avgdiffbpm, averageDiff,stddev,minErr,maxErr] = calculateErrors(HRs,hbRate);


%----------------------Plots------------------------------

figure(2)
x = linspace(1,length(temp_arrayfalse),length(temp_arrayfalse));
plot(filteredSignal),hold on
plot(x,temp_arrayfalse),hold on

x = linspace(1,length(temp_array),length(temp_array));
plot(x,temp_array)
legend('Filtered signal','After peak detecting', 'After adaptive gap')

figure(3)
 
plot(gap_array)

xlabel('Lags')
ylabel('Gap size value')




