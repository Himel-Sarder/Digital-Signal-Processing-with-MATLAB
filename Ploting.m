% Ploting a continous Signal
t = 0:0.1:10;
x = sin(t);
plot(t, x, '--r', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave');
grid on;

t = 0:0.001:1;           % continuous time
x = sin(2*pi*5*t);       % 5 Hz sine wave

plot(t, x, 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Continuous-Time Sine Wave');
grid on;


% plot(x, y, '-r')     % Red solid line
% plot(x, y, '--b')    % Blue dashed line
% plot(x, y, 'o-g')    % Green line with circle markers
% plot(x, y, '*:m')    % Magenta dotted line with star markers

% Multiple Lines in One Plot
plot(t, sin(x), 'r', t, cos(x), 'b--', 'LineWidth', 1.5)
legend('sin(x)', 'cos(x)');

% Plotting Discrete-Time Signals
n = 0:10;
x = 2 * n;
stem(n, x, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Discrete-Time Signal');
grid on;

n = 0:10;
x = sin(0.2*pi*n);

stem(n, x, 'filled');
xlabel('n');
ylabel('Amplitude');
title('Discrete-Time Signal');
grid on;

% Multiple Subplots
t = 0:0.1:2*pi;
x = sin(t);
y = cos(t);

subplot(2,1,1);  % 2 rows, 1 column, 1st plot
plot(t, x, 'r');
title('Sine Wave');

subplot(2,1,2);  % 2 rows, 1 column, 2nd plot
plot(t, y, 'b');
title('Cosine Wave');

% Hold Multiple Plots on Same Axes
plot(x, sin(x), 'r');
hold on;
plot(x, cos(x), 'b--');
hold off;
legend('sin(x)', 'cos(x)');

