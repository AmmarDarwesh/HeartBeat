
PPGSigAcc = readtable('1649075174115_ppg_test2_ammar');
hbRef = readtable('2022-04-04 1426_test2_referens.csv');
PPGsignals = table2array(PPGSigAcc(:,2));
accX = table2array(PPGSigAcc(:,3));
accY = table2array(PPGSigAcc(:,4));
accZ = table2array(PPGSigAcc(:,5));

x = linspace(1,72,2137);

plot(x,PPGsignals),hold on
xlabel('Time(s)')
ylabel('PPG Values')

Fs = 30;  % Sampling Frequency

N      = 15;   % Order
Fstop1 = 0.4;  % First Stopband Frequency
Fpass1 = 1;    % First Passband Frequency
Fpass2 = 3;    % Second Passband Frequency
Fstop2 = 4;    % Second Stopband Frequency
Wstop1 = 1;    % First Stopband Weight
Wpass  = 1;    % Passband Weight
Wstop2 = 1;    % Second Stopband Weight
dens   = 20;   % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
           0], [Wstop1 Wpass Wstop2], {dens});
Hd = dfilt.dffir(b);
filteredSignal = filter(Hd,PPGsignals); %filters the signal



%%%%%%%%%%%%%%%%%%%%%%%%%PAST THESIS AUTOCORRELATION METHOD%%%%%%%%%%%%%%%%%%%%%%%

%Samples to search between in the autocorrelation
Nmin = 10; 
Nmax = 38;

window = 150; % Windowsize in samples


BPM1values = [];    %Stores the values from equation 9
BPM2values = [];    %Stores the values from equation 8

for l = 150:30:(length(filteredSignal))
    if (l+window) > (length(filteredSignal))    %Used to not reach out of bounds
        display(l); %#ok<DISPLAYPROG>
        break;
    end
    maxValue = 0;
    peakLoc = 0;
    
    [acf, lags] = autocorr(filteredSignal(l:l+window), 150);
    for k = Nmin:Nmax
        if (acf(k)) > maxValue
            maxValue = acf(k);
            peakLoc = lags(k);
            peakLoc
        end
    end
    BPM1 = (((1000/30)/peakLoc)*60); %Equation 9 in our thesis
    BPM2 = ((60*30)/peakLoc)        %Equation 8 in our thesis
    BPM1values(end +1 ) = BPM1; %#ok<SAGROW>
    BPM2values(end +1 ) = BPM2; %#ok<SAGROW>
end   



