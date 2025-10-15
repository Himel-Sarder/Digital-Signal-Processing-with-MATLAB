% Write a program to implement addition and multiplication of 2 different
% signal
clc;
close all;
clear all;

Fs = 4000;  % sampling frequency
ts = 1/Fs;
t = 0:ts:1;

% For first signal
f = 4;
x = sin(2*pi*f*t);
subplot(4,1,1);
plot(t,x);
title('First Signal');
xlabel('Time in Seconds');
ylabel('Ampltude');

% For second signal
f1 = 5;
y = sin(2*pi*f1*t);
subplot(4,1,2);
plot(t,y);
title('First Signal');
xlabel('Time in Seconds');
ylabel('Ampltude');

% Addition of signals
subplot(4,1,3);
plot(t,x+y);
title('Additional Signal');
xlabel('Time in Seconds');
ylabel('Ampltude');

% Multiplication of signals
subplot(4,1,4);
plot(t,x.*y);
title('Multiplicational Signal');
xlabel('Time in Seconds');
ylabel('Ampltude');
