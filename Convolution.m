% MATLAB Code to Compute Convolution Sum

% Define the two discrete signals
x = [1, 2, 3, 4]; % Example input signal x[n]
h = [1, -1, 2];   % Example impulse response h[n]

% Compute the convolution sum using MATLAB's built-in conv() function
y = conv(x, h);

% Display the results
disp('Input signal x[n]:');
disp(x);
disp('Impulse response h[n]:');
disp(h);
disp('Convolution result y[n]:');
disp(y);

% Plot the signals
figure;

% Plot x[n]
subplot(3, 1, 1);
stem(0:length(x)-1, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

% Plot h[n]
subplot(3, 1, 2);
stem(0:length(h)-1, h, 'filled');
title('Impulse Response h[n]');
xlabel('n');
ylabel('h[n]');
grid on;

% Plot y[n]
subplot(3, 1, 3);
stem(0:length(y)-1, y, 'filled');
title('Convolution Result y[n]');
xlabel('n');
ylabel('y[n]');
grid on;



% Convolution Sum হলো দুটি discrete signal কে combine করে তৃতীয় একটি output signal তৈরির প্রক্রিয়া — যেটি সাধারণত LTI (Linear Time Invariant) system-এর response বের করতে ব্যবহার করা হয়।
% h[n] => Impulse Response
% Term Meaning
% Impulse	====> একদম ছোট, দ্রুত, single spike input
% Impulse Response (h[n]) ====>	System কিভাবে react করে তার full signature
% Why important? ====> h[n] জানলেই system-এর সব output calculate করা যায়
