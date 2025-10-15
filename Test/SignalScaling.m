clc;
close all;
clear;

% User input for scaling
value = input("Scaling Value: ");  

% ---------------- Discrete Signal ----------------
x = [-2, 3, 6, 0, 1, 9, 1, 8];
n = -floor(length(x)/2) : floor((length(x)-1)/2);
scaledX = value * x;

figure;

subplot(2,1,1);
stem(n, x, 'b', 'filled');        % Main signal in blue
hold on;
stem(n, scaledX, 'r');            % Scaled signal in red
xlabel('n');
ylabel('Amplitude');
title('Shifted & Scaled Discrete Signal');
legend("Main Signal", "Scaled Signal");
grid on;

% ---------------- Continuous Signal ----------------
fs = 1000;
t = 0:1/fs:1;
f = 10;
x2 = 5 * sin(2*pi*f*t);
scaledX2 = x2 * value;

subplot(2,1,2);
plot(t, x2, 'b', 'LineWidth', 2);
hold on;
plot(t, scaledX2, 'r', 'LineWidth', 2);
xlabel('t');
ylabel('Amplitude');
title('Shifted & Scaled Continuous Signal');
legend("Main Signal", "Scaled Signal");
grid on;
