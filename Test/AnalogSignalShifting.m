clc;
clear;
close all;

%% ---------------- Parameters ----------------
fs = 1000;           % Sampling frequency
f = 10;              % Sine wave frequency
t = 0:1/fs:1;        % Time vector (0 to 1 second)
x = 5 * sin(2*pi*f*t);

y = 10 * randn(1, length(t));  % Random noise (row vector)
mixed = x + y;                 % Mixed signal

%% ---------------- Time Shift Input ----------------
n = input('Time to shift (seconds): ');

samples2shift = round(fs * n);  % Convert seconds to integer samples

%% ---------------- Right Shift (Delay) ----------------
rightShift = [zeros(1, samples2shift), mixed(1:end-samples2shift)];

%% ---------------- Left Shift (Advance) ----------------
leftShift = [mixed(samples2shift+1:end), zeros(1, samples2shift)];

%% ---------------- Plot ----------------
figure;
plot(t, mixed, 'b', 'LineWidth', 1.5); hold on;
plot(t, leftShift, 'r--', 'LineWidth', 1.5);
plot(t, rightShift, 'g--', 'LineWidth', 1.5);

xlabel('Time (s)');
ylabel('Amplitude');
title('Time Shifting Example: Left (Advance) & Right (Delay)');
legend('Original','Advanced (Left)','Delayed (Right)');
grid on;

% ================= Signal Shifting =================
% Signal Shifting কেন করা হয়:
%
% 1. Signal কে সময়ের সাথে মিলিয়ে আনার জন্য
%    - উদাহরণ: দুইটা সাউন্ড বা সেন্সর সিগন্যাল ঠিক একই সময়ে বাজুক।
%
% 2. System পরীক্ষা করার জন্য
%    - কোনো সিস্টেম input দিলে output কেমন হয় তা দেখার জন্য signal এগিয়ে বা পিছিয়ে দেওয়া হয়।
%
% 3. Delay বা Echo দেখানোর জন্য
%    - রিয়েল লাইফে signal পরে পৌঁছালে সেটা simulate করার জন্য।
%
% 4. Signal বিশ্লেষণ সহজ করার জন্য
%    - যেমন, phase ঠিক করা বা alignment করা।
%
% সংক্ষেপে: Signal Shifting হলো signal কে আগের বা পরে সরানো,
% যাতে timing ঠিক রাখা যায় বা system analyze করা যায়।
% ====================================================
