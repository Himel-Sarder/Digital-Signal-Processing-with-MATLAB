clc;
clear;
close all;

%% ---------------- Time Domain Signal ----------------
fs = 1000;               % Sampling frequency (Hz)
t = 0:1/fs:1;            % Time vector (1 second)
f1 = 50;                 % Frequency component 1 (Hz)
f2 = 150;                % Frequency component 2 (Hz)

x = sin(2*pi*f1*t) + sin(2*pi*f2*t);  % Composite signal

figure;
subplot(4,1,1);
plot(t, x, 'b', 'LineWidth', 1.5);
title('Original Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% ---------------- FFT of Original Signal ----------------
N = length(x);
NFFT = 2^nextpow2(N);
X = fft(x, NFFT);
f = 0:NFFT-1;
magX = abs(X);

subplot(4,1,2);
plot(f, magX, 'r', 'LineWidth', 1.5);
title('Frequency Domain (Original Signal)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);   % Show only positive frequencies
grid on;

%% ---------------- Apply Low Pass Filter ----------------
fc = 100;     % Cut-off frequency (Hz)
order = 4;    % Filter order
y_low = lowpassFilter(x, fs, fc, order);

subplot(4,1,3);
plot(t, y_low, 'r', 'LineWidth', 1.5);
title('Low Pass Filtered Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% ---------------- FFT of Filtered Signal ----------------
N = length(y_low);
NFFT = 2^nextpow2(N);
Y = fft(y_low, NFFT);
f = (0:NFFT-1) * (fs/NFFT);
magY = abs(Y);

subplot(4,1,4);
plot(f, magY, 'r', 'LineWidth', 1.5);
title('Frequency Domain (Filtered Signal)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);
grid on;

%% ==================== Low Pass Filter Function ====================
function y = lowpassFilter(signal, Fs, fc, order)
    lpass = designfilt('lowpassiir', ...
        'FilterOrder', order, ...
        'SampleRate', Fs, ...
        'HalfPowerFrequency', fc);
    y = filtfilt(lpass, signal);  % Zero-phase filtering
end
