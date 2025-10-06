n = 0:5;
x1 = [1 2 3 4 5 6];
x2 = [6 5 4 3 2 1];

y = x1 + x2;

stem(n, y, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Added Signal y[n] = x1[n] + x2[n]');

% Time vector
t = 0:0.001:1;  % From 0 to 1 second with 1ms step

% Define two signals
f1 = 5;                      % Frequency of first signal (Hz)
f2 = 10;                     % Frequency of second signal (Hz)
s1 = sin(2*pi*f1*t);         % First sine wave
s2 = sin(2*pi*f2*t);         % Second sine wave

% Signal addition (Continous Signal)
sum = s1 + s2;

% Plot the signals
figure;

subplot(3,1,1);
plot(t, s1);
title('Signal 1: 5 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, s2);
title('Signal 2: 10 Hz Sine Wave');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, sum);
title('Sum of Signal 1 and Signal 2');
xlabel('Time (s)');
ylabel('Amplitude');

