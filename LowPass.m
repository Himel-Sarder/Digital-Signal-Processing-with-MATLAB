clc; close all; clear;

Fs = 1000;
t = 0:1/Fs:1;
f = 50;
X = 5 * sin(2*pi*f*t);

subplot(4,1,1)
plot(t, X, 'LineWidth', 2.5)
xlabel('Time (s)')
ylabel('Amplitude')
title('Original Signal')

Y = 15 * randn(size(t));
subplot(4,1,2)
plot(t, Y, 'LineWidth', 2.5)
xlabel('Time (s)')
ylabel('Amplitude')
title('Noise Signal')

Z = X + Y;
subplot(4,1,3)
plot(t, Z, 'LineWidth', 2.5)
xlabel('Time (s)')
ylabel('Amplitude')
title('Mixed Noisy Signal')

Fc_low = 50;
order = 6;
lpassfilt = designfilt('lowpassiir', 'FilterOrder', order, ...
                       'HalfPowerFrequency', Fc_low, 'SampleRate', Fs);

y_low = filtfilt(lpassfilt, Z);
subplot(4,1,4)
plot(t, y_low, 'r', 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Amplitude')
title('Filtered Signal')

