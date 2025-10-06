clc;
clear all;
close all;

t = 0:0.1:0.3;
% So t = [0   0.1   0.2   0.3]

x = [1, 2, 3, 4]
% For random signal genration : x = randn(1, length(t));

subplot(2,1,1);
plot(t, x, 'b', 'LineWidth', 2);
title('Signal x');
xlabel('Time');
ylabel('Amplitude');

m = xcorr(x, x);  
% m = [4, 11, 20, 30, 20, 11, 4]     length(m) = 2 * length(x) - 1 = 7
disp("m = ")
disp(m)

t1 = t;
t2 = -fliplr(t1);

% t1 = [0   0.1   0.2   0.3]
% t2 = [-0.3, -0.2, -0.1, 0]

n1 = min(t1) + min(t2);   % n1 = 0 + (-0.3) = -0.3
n2 = max(t1) + max(t2);   % n2 = 0.3 + 0 = 0.3
n = linspace(n1, n2, length(m));  % n = linspace(-0.3, 0.3, 7)
% n = [-0.3  -0.2  -0.1   0   0.1   0.2   0.3]
disp("n = ")
disp(n)


subplot(2,1,2);
plot(n, m, 'm', 'Linewidth', 2);
title('Auto-correlation of x');
xlabel('Lag');
ylabel('Correlation');
