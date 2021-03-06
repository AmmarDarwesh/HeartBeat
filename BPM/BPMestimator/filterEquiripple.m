function Hd = filterEquiripple
%FILTEREQUIRIPPLE Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.10 and Signal Processing Toolbox 8.6.
% Generated on: 10-May-2022 13:28:31

% Equiripple Bandpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 30;  % Sampling Frequency

N      = 15;   % Order
Fstop1 = 0.5;  % First Stopband Frequency
Fpass1 = 1;    % First Passband Frequency
Fpass2 = 3;    % Second Passband Frequency
Fstop2 = 4;    % Second Stopband Frequency
Wstop1 = 10;   % First Stopband Weight
Wpass  = 10;   % Passband Weight
Wstop2 = 10;   % Second Stopband Weight
dens   = 20;   % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop1 Fpass1 Fpass2 Fstop2 Fs/2]/(Fs/2), [0 0 1 1 0 ...
    0], [Wstop1 Wpass Wstop2], {dens});

Hd = dfilt.dffir(b);


% [EOF]
