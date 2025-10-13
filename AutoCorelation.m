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

% ==============================================================================
% Another easy way 
% ==============================================================================
clc;
close all;
clear;

% --- Signal Definition ---
t = 0:0.01:1;     % Time vector
f = 5;            % Frequency in Hz
A = 2;            % Amplitude
x = A * sin(2 * pi * f * t);   % Sine wave signal

% --- Plot Original Signal ---
subplot(2,1,1)
plot(t, x, 'LineWidth', 2);
title('Original Signal x(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% --- Auto-Correlation ---
[R_xx, lags] = xcorr(x, x);   % Auto-correlation

% --- Plot Auto-Correlation ---
subplot(2,1,2)
stem(lags, R_xx, 'filled', 'LineWidth', 1.5);
title('Auto-Correlation R_{xx}');
xlabel('Lag');
ylabel('Correlation Value');
grid on;




% Auto-correlation হলো একই সিগনালের সাথে তার নিজের মিল (similarity) পরিমাপ করার পদ্ধতি, যেখানে সিগনালটাকে ধীরে ধীরে shift (lag) করে দেখা হয় — কোন অবস্থানে নিজেই নিজের সাথে সবচেয়ে বেশি match করে।

% সহজ উদাহরণ:

% ধরো, একটি waveform আছে
% তুমি সেই waveform-টাকেই সামান্য ডানে সরিয়ে overlap করাও... আবার আরও সরাও... এভাবে দেখতে থাকো কোথায় সবথেকে বেশি মিল হচ্ছে।
% যে shift-এ সবচেয়ে বেশি ম্যাচিং হয়, সেই ল্যাগ-এ auto-correlation মান সর্বোচ্চ হয়।

% Auto-Correlation Applications
% 1️⃣ Signal Processing / Communication
% Pitch detection: গান বা স্পিচে মূল frequency বের করতে
% Echo detection: Signal delay বা reflection detect করা
% Noise analysis: Signal এর মধ্যে noise quantify করা
% Synchronization: Receiver ও transmitter signal sync করতে

% 2️⃣ Radar & Sonar
% Object distance বা speed detect করতে
% Signal reflection time বের করতে

% 3️⃣ Digital Communication
% Error detection: Signal distortion বা corruption চেক করা
% Channel analysis: Signal multipath বা delay estimate করা

% 4️⃣ Time Series Analysis
% Stock prices বা economic data trend detect করা
% Data set এর periodic pattern বোঝা

% 5️⃣ Audio / Music Analysis
% Musical note detection
% Repeating rhythm বা beat analysis

% 6️⃣ Image Processing
% Texture analysis: Image texture এর repetitive pattern detect করা
% Motion detection: Video frames এর similarity measure করা



% Observation	                                        বোঝায় কি?
% Lag = 0 তে সর্বোচ্চ পিক (Highest Peak)	              নিজেকেই নিজের সাথে compare করলে সবচেয়ে বেশি similarity থাকে → Max correlation at lag = 0 
% Lag ±20, ±40, ±60 এ আবার peak আছে	                এটাকে বলে periodic peaks → Signal এর period ওই ল্যাগের সমান
% যত ল্যাগ বাড়ে, পিকের মান কমে	                      কারণ দূরের sample গুলো মিলে similarity কমে যায় → Energy decay
% Positive এবং Negative উভয় lag এ symmetric pattern	Auto-correlation সবসময় symmetric হয় Rxx(τ) = Rxx(-τ)
% Correlation Value = 200 (Maximum Energy)            মানে signal-এর total energy/sum of squared amplitude সবচেয়ে বেশি এই point এ contribute করেছে।
