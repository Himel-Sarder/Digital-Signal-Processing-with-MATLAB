clc;
clear;
close all;

% Time domain signal
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f1 = 50;                % Frequency component 1
f2 = 150;               % Frequency component 2
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);  % Composite signal

subplot(2,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% FFT
N = length(x);          % Number of samples

NFFT = 2^nextpow2(N);

X = fft(x, NFFT);             % Built-in FFT function

f = (0:(NFFT/2)-1)*(fs/NFFT);     % Frequency axis

magX = abs(X);

mag = magX(1:NFFT/2);

% Magnitude Spectrum
subplot(2,1,2);
plot(f, mag, 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;



%% Another way      ======> Two-Sided Spectrum + xlim([0 fs/2])
clc;
clear;
close all;

% Time domain signal
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f1 = 50;                % Frequency component 1
f2 = 150;               % Frequency component 2
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);  % Composite signal

subplot(2,1,1);
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
subplot(2,1,2);
plot(f, magX, 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);      % Show only positive frequencies
grid on;
