clc;
clear;
close all;

% Time domain signal
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f1 = 50;                % Frequency component 1
f2 = 150;               % Frequency component 2
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);  % Composite signal

subplot(5,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% FFT
N = length(x);          % Number of samples

NFFT = 2^nextpow2(N);

X = fft(x, NFFT);             % Built-in FFT function

f = 0:NFFT-1;     % Frequency axis

magX = abs(X);

% Magnitude Spectrum
subplot(5,1,2);
plot(f, magX, 'r', 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);      % Show only positive frequencies
grid on;


% Low Pass
fc = 100;
order = 4;


% Cutoff Slope
% Order যত বেশি, slope তত বেশি খাড়া হয়।
% Filter Order	Attenuation Rate
% Order 1	20 dB per decade
% Order 2	40 dB per decade
% Order 4	80 dB per decade (খুব শার্প কাটবে)

% ====================== FILTER ORDER EXPLANATION =========================
% ধরো তুমি noise কাটার জন্য ৪টা ফিল্টার একটার পর একটা সিরিজে লাগালে — 
% এটাই Filter Order = 4 হিসেবে ধরা হয়।
%
% অর্থাৎ —
% "একটা ফিল্টারকে যত বেশি ধাপ (stage) বা স্তর দিয়ে তৈরি করা হয়,
% সেই সংখ্যাই তার Order।"
%
% Real-Life Example — Volume Control ধারণা
% --------------------------------------------
% ধরো তোমার কাছে একটা গান আছে যেটাতে অনেক high-frequency noise আছে।
%
% যদি তুমি একবারে সামান্য কমাও → noise অল্প কমবে → এটা Filter Order = 1 এর মত।
% কিন্তু যদি ৪ বার ধাপে ধাপে কমাও → noise অনেক বেশি কমবে → এটা Filter Order = 4।
%
% তুলনামূলক ধারণা:
%
%   Filter Order    Output Quality         Noise Reduction Power
%   ------------    -------------------    -------------------------
%   Order 1         মোটামুটি              কম
%   Order 2         ভালো                মাঝারি
%   Order 4         অনেক পরিষ্কার        অনেক বেশি কাটবে
%
% তাই, Order যত বেশি হবে → Cutoff এর পরের অপ্রয়োজনীয় frequency 
% তত তাড়াতাড়ি এবং বেশি মাত্রায় কেটে ফেলা হবে।
% ========================================================================


lpass = designfilt('lowpassiir', 'FilterOrder', order, 'SampleRate', fs, 'HalfPowerFrequency', fc);

y_low = filtfilt(lpass, x);

subplot(5,1,3);
plot(t, y_low, 'r', 'LineWidth', 1.5);
title('Low pass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude');    % Show only positive frequencies
grid on;


% FFT
N = length(y_low);          % Number of samples

NFFT = 2^nextpow2(N);

X = fft(y_low, NFFT);             % Built-in FFT function

f = 0:NFFT-1;     % Frequency axis

magX = abs(X);

% Magnitude Spectrum
subplot(5,1,4);
plot(f, magX, 'r', 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);      % Show only positive frequencies
grid on;
