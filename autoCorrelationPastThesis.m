 clc, clear all
% 
% %--------------------------------------------RESTING-----------------------------------------
% 
% %-------------------------------------Ammar------------------------------------------------
% 
% dat1 = readtable('Tester Ammar och miran resting/Ammar/1650285277992 Test 1 Ammar.csv');
% fromBand = readtable('Tester Ammar och miran resting/Ammar/2022-04-18 1434 Test 1 Ammar Referens.csv');
% 
% dat1 = readtable('Tester Ammar och miran resting/Ammar/1650285374533 Test 2 Ammar.csv');
% fromBand = readtable('Tester Ammar och miran resting/Ammar/2022-04-18 1435 Test 2 Ammar referens.csv');
%  
dat1 = readtable('Tester Ammar och miran resting/Ammar/1650285460194 test 3 Ammar.csv');
fromBand = readtable('Tester Ammar och miran resting/Ammar/2022-04-18 1437 test 3 Ammar Referens.csv');
% 
% %-------------------------------------Miran------------------------------------------------
% 
% dat1 = readtable('Tester Ammar och miran resting/Miran/1650283542885_ppg test 1 Miran.csv');
% fromBand = readtable('Tester Ammar och miran resting/Miran/2022-04-18 1405 Test 1 miran Ref.csv');
% 
dat1 = readtable('Tester Ammar och miran resting/Miran/1651326756208_ppg.csv');
fromBand = readtable('Tester Ammar och miran resting/Miran/2022-04-30_1552.csv');
% 
% % dat1 = readtable('Tester Ammar och miran resting/Miran/1650283817606_ppg Test 3 Miran.csv');
% % fromBand = readtable('Tester Ammar och miran resting/Miran/2022-04-18 1410 test 3 miran ref.csv');
% 
% %--------------------------------------------Chair Movement-----------------------------------------
% 
% %-------------------------------------Ammar------------------------------------------------
% 
% 
% dat1 = readtable('Tester Chair movement/Ammar/1650372092265_ppg test 1 chair.csv');
% fromBand = readtable('Tester Chair movement/Ammar/2022-04-19 1441 test 1 ref.csv');
% % 
% dat1 = readtable('Tester Chair movement/Ammar/1650372247439_ppg test 2 chair.csv');
% fromBand = readtable('Tester Chair movement/Ammar/2022-04-19 1444 test 2 ref.csv');
% 
% dat1 = readtable('Tester Chair movement/Ammar/1650372500735_ppg test 3 chair.csv');
% fromBand = readtable('Tester Chair movement/Ammar/2022-04-19 1448 test 3 ref.csv');
% 
% %-------------------------------------Miran------------------------------------------------
% 
% 
% dat1 = readtable('Tester Chair movement/Miran/1650365618024_ppg_Miran_chair_test1.csv');
% fromBand = readtable('Tester Chair movement/Miran/2022-04-19 1253_Miran_test1_referens.csv');
% 
% dat1 = readtable('Tester Chair movement/Miran/1650365743749_ppg_Miran_char_test2.csv');
% fromBand = readtable('Tester Chair movement/Miran/2022-04-19 1255_test2_referens_chair.csv');
% 
% dat1 = readtable('Tester Chair movement/Miran/1650365823349_ppg_Miran_chair_test3.csv');
% fromBand = readtable('Tester Chair movement/Miran/2022-04-19 1257_test3_referens_chair.csv');
% 
% %--------------------------------------------Tester Jogging-----------------------------------------
% 
% %-------------------------------------Ammar------------------------------------------------
% 
% 
% dat1 = readtable('Tester Jogging/Ammar/1650369883713_ppg jogging ammar test 1.csv');
% fromBand = readtable('Tester Jogging/Ammar/2022-04-19 1404 test 1 ammar ref jogging.csv');
% 
% % dat1 = readtable('Tester Jogging/Ammar/1650370044277_ppg jogging ammar test 2.csv');
% % fromBand = readtable('Tester Jogging/Ammar/2022-04-19 1407 test 2 ref jogging.csv');
% 
% % dat1 = readtable('Tester Jogging/Ammar/1650370145505_ppg jogging ammar 3.csv');
% % fromBand = readtable('Tester Jogging/Ammar/2022-04-19 1409 test 3 ref jogging.csv');

%-------------------------------------Miran------------------------------------------------


% dat1 = readtable('Tester Jogging/Miran/1650369103946_ppg test 1 jogging miran.csv');
% fromBand = readtable('Tester Jogging/Miran/2022-04-19 1351 test 1 miran ref jogging.csv');

% dat1 = readtable('Tester Jogging/Miran/1650369219294_ppg test 2 jogging miran.csv');
% fromBand = readtable('Tester Jogging/Miran/2022-04-19 1353 test 2 miran ref jogging.csv');

% dat1 = readtable('Tester Jogging/Miran/1650369388036_ppg test 3 jogging miran.csv');
% fromBand = readtable('Tester Jogging/Miran/2022-04-19 1356 test 3  ref jogging .csv');

%--------------------------------------------Tester Walking-----------------------------------------

%-------------------------------------Ammar------------------------------------------------


% dat1 = readtable('Tester Walking/Ammar/1650368535244_ppg_Ammar_test1.csv');
% fromBand = readtable('Tester Walking/Ammar/2022-04-19 1342 ammar ref walking 1.csv');

% dat1 = readtable('Tester Walking/Ammar/1650368627264_ppg_waliking_test2_ammar.csv');
% fromBand = readtable('Tester Walking/Ammar/2022-04-19 1343 ammar ref walking 2.csv');

% dat1 = readtable('Tester Walking/Ammar/1650368717451_ppg_test3_ammar.csv');
% fromBand = readtable('Tester Walking/Ammar/2022-04-19 1345 ammar ref walking 3.csv');
% 
%-------------------------------------Miran------------------------------------------------


% dat1 = readtable('Tester Walking/Miran/1650367885141_ppg_walking_test1_miran.csv');
% fromBand = readtable('Tester Walking/Miran/2022-04-19 1331 Miran Test 1 Referens Walking.csv');

% dat1 = readtable('Tester Walking/Miran/1650367977191_ppg_walking_test2_miran.csv');
% fromBand = readtable('Tester Walking/Miran/2022-04-19 1332 test 2 miran referens walking.csv');

% dat1 = readtable('Tester Walking/Miran/1650368100823_ppg_waling_test3.csv');
% fromBand = readtable('Tester Walking/Miran/2022-04-19 1334 test 3 miran walking ref.csv');


dateFromBand = table2array(fromBand(:,1));
timeStampBand = table2array(fromBand(:,1));
BPMfromBand = table2array(fromBand(:,2));
dataFromFile=table2array(dat1(:,2));
convertedData = table2array(dat1(:,2));
timeStampData=table2array(dat1(:,1));
timeStampDataInSeconds = table2array(dat1(:,1));


%Variable "timeConvert" is used to find where ground truth and collected data synchronise
%their timestamps. Sample 150 used as its 5 seconds in to the collected
%signal.

% timeConvert = datetime(time(150),'ConvertFrom','epochtime','TicksPerSecond',1e3,'Format','dd-MMM-yyyy HH:mm:ss.SSS')+hours(2)


tempCounter = 1;

for i = 8:length(BPMfromBand)
    
    BPMfromBand(tempCounter) = BPMfromBand(i);
    tempCounter = tempCounter +1;
    
end

tempCounter = 1;

for i = 8:length(timeStampData)
    
    timeStampData(tempCounter) = timeStampData(i);
    tempCounter = tempCounter +1;
    
end

for i = 1:length(timeStampData)
    if i == 1
        timeStampDataInSeconds(i) = 0;
    else
       timeStampDataInSeconds(i) = (timeStampData(i) - timeStampData(1)) / 1000;
    end
end



%Convert the collected data from non-stationary to stationary.
for j = 1:length(convertedData)
    if j == 1
        convertedData(j) = 0;
    else
        convertedData(j) = dataFromFile(j) - dataFromFile(j-1);
    end
end
 
%Designing filter, might require "filterDesigner" to be installed in MATLAB.
Fs = 30;  % Sampling Frequency
N   = 10;   % Order
Fc1 = 0.9;  % First Cutoff Frequency
Fc2 = 3.0;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');
FilterSignalHd=filter(Hd,convertedData);

%Samples to search between in the autocorrelation
Nmin = 10; 
Nmax = 38;

window = 150; % Windowsize in samples


BPM1values = [];    %Stores the values from equation 9
BPM2values = [];    %Stores the values from equation 8

for l = 150:30:1700
    if (l+window) > (length(FilterSignalHd))    %Used to not reach out of bounds
        display(l); %#ok<DISPLAYPROG>
        break;
    end
    maxValue = 0;
    peakLoc = 0;
    
    [acf, lags] = autocorr(FilterSignalHd(l:l+window), 150) 
    for k = Nmin:Nmax
        if (acf(k)) > maxValue
            maxValue = acf(k);
            peakLoc = lags(k);
        end
    end
    BPM1 = (((1000/30)/peakLoc)*60); %Equation 9 in our thesis
    BPM2 = ((60*30)/peakLoc);        %Equation 8 in our thesis
    BPM1values(end +1 ) = BPM1; %#ok<SAGROW>
    BPM2values(end +1 ) = BPM2; %#ok<SAGROW>
end   
 
delay = 1;      %Delay from ground truth
averageDiff = [];
diffrenecebpm = [];
%Comparing the ground truth with our BPM estimation. Making c longer
%creates an offset in the comparison. Used when finding potential delay.

    difference = [];
    samplestartBand = 5; % The index of the synchronized value from the ground truth
    

for b = 1:length(BPM2values)-5
    temp = BPM2values(b) - BPMfromBand(samplestartBand + delay);
    difference(end+1) = (abs(temp)/BPMfromBand(samplestartBand + delay))*100; %#ok<SAGROW>
    samplestartBand  = samplestartBand + 1;
    
    diffrenecebpm(end+1) = abs(temp);
    
end
averageDiffBPM = mean(diffrenecebpm);
minErr = min(difference);
maxErr = max(difference);
delay = delay + 1; % Only used when to add additional offset. 
averageDiff(end+1) = mean(difference);
stddev = std(difference);

