clc;
close all;
clear;

Fs = 1000;        % Sampling Frequency
t = 0:1/Fs:1;     % Time Vector

x = 10 * randn(length(t), 1);       % Random Noise Signal 1
y = rand(1, length(t));             % Random Noise Signal 2

% 1 → rows (একটি row)
% length(t) → columns (x-axis এর সাথে match করতে columns same হবে)
% অর্থাৎ, এটি 1×N row vector তৈরি করছে, যেখানে N = length(t)।
% যদি তুমি লিখতে rand(length(t), 1) → তাহলে column vector হবে।
% দুইটাই plot করা যাবে, কিন্তু row vector সাধারণত time vector t এর সাথে direct plot এ বেশি convenient।

figure;
subplot(2,1,1);
plot(t, x, 'g', 'LineWidth', 2);
xlabel("Time (s)");
ylabel("Amplitude");
title("Random Noise Signal 1");
grid on;

subplot(2,1,2);
plot(t, y, 'b', 'LineWidth', 2);
xlabel("Time (s)");
ylabel("Amplitude");
title("Random Noise Signal 2");
grid on;

% ============================= BASIC CONCEPT EXPLANATION =============================

% 1. Sampling Frequency (Fs) মানে কি?
% Answer:
% Sampling Frequency হলো প্রতি সেকেন্ডে কতবার continuous signal থেকে sample নেওয়া হচ্ছে।
% একে Hz (samples per second) এ মাপা হয়।
% উদাহরণ: Fs = 1000 Hz মানে 1 সেকেন্ডে 1000টি sample নেওয়া হচ্ছে।

% 2. randn() আর rand() এর মধ্যে পার্থক্য কি?
% Answer:
% randn() → Gaussian Noise generate করে (mean = 0, standard deviation = 1)
% rand()  → Uniform random numbers generate করে 0 থেকে 1 এর মধ্যে
% Visual difference: randn() centered around 0, rand() সব positive values

% 3. Random signal আর sine/cosine wave signal-এর মধ্যে পার্থক্য কি?
% Answer:
% Sine/Cosine → Periodic, predictable signal
% Random signal → Non-periodic, unpredictable, amplitude fluctuate randomly

% 4. Nyquist theorem কি এবং কেন গুরুত্বপূর্ণ?
% Answer:
% Nyquist theorem বলে sampling frequency (Fs) ≥ 2 × highest signal frequency (f)
% না হলে aliasing হবে এবং signal distort হবে
% এটি ensure করে signal ঠিকভাবে digital form-এ capture হয়

% 5. Time vector t = 0:1/Fs:1 কেন ব্যবহার করা হয়েছে?
% Answer:
% t = 0:1/Fs:1 → Time vector from 0 to 1 second, step size = 1/Fs
% Step size = sampling interval → প্রতি sample এর সময়ের ফাঁক
% নিশ্চিত করে পুরো signal 1 second এর মধ্যে correct number of samples capture হয়েছে

% ========================================================================
