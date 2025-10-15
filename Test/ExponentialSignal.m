clc;
close all;
clear;

n = -5:5;   % Time index

% Exponential Signal
a = 0.7;                 % Decay/Growth factor (0 < a < 1 হলে decay, a > 1 হলে growth)
x = a .^ n;              % Exponential expression

figure;
stem(n, x, 'm', 'filled');          
xlabel('n');
ylabel('Amplitude');
title('Exponential Signal a^n');
grid on;

% Exponential signal x[n] = a^n 
% যদি a < 1 হয় → signal ধীরে ধীরে কমতে থাকে (decaying).
% যদি a > 1 হয় → signal ক্রমাগত বড় হয় (growing).
% এই ধরনের signal natural response, system stability এবং DSP তে অনেক জায়গায় ব্যবহৃত হয়।
