clc;
clear all;
close all;

% Input discrete signal
x = [1 2 3 4];   % Example signal
N = length(x);   % Number of samples

% Initialize DFT result
X = zeros(1, N);

% Compute DFT manually
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-1j*2*pi*k*n/N);
    end
end

% Compute magnitude and phase
magX = abs(X);
phaseX = angle(X);

% Display results
disp('Input x[n]:');
disp(x);
disp('DFT X[k]:');
disp(X);
disp('Magnitude Spectrum:');
disp(magX);
disp('Phase Spectrum (radians):');
disp(phaseX);

% Frequency index
k = 0:N-1;

% Plot results
subplot(3,1,1);
stem(0:N-1, x, 'filled');
title('Input Signal x[n]');
xlabel('n'); ylabel('Amplitude');

subplot(3,1,2);
stem(k, magX, 'filled');
title('Magnitude Spectrum |X[k]|');
xlabel('k'); ylabel('Magnitude');

subplot(3,1,3);
stem(k, phaseX, 'filled');
title('Phase Spectrum ∠X[k]');
xlabel('k'); ylabel('Phase (radians)');
