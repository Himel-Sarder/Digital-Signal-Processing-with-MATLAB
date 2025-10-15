clc;
close all;
clear;

fs = 1000;
f = 20;
t = 0:1/fs:1;

sinwave = 5 * sin(2*pi*f*t);

coswave = 15 * cos(2*pi*f*t);

subplot(2,1,1);
plot(t, sinwave, 'r', 'LineWidth', 2);
xlabel("time (s)");
ylabel("Amplitude");
title("Sin wave signal");
grid on;

% hold on;  For overlap plot
% legend;

subplot(2,1,2);
plot(t, coswave, 'b', 'LineWidth', 2);
xlabel("time (s)");
ylabel("Amplitude");
title("Cos wave signal");
grid on;



% ============================= BASIC CONCEPT EXPLANATION =============================
% 1. Sine wave আর Cosine wave এর মধ্যে পার্থক্য কি?
% Answer:
% Sine এবং Cosine দুটোই periodic signal, শুধু phase difference আছে।
% Cosine wave আসলে sine wave-এর 90° বা π/2 phase shifted version।
% cos(θ) = sin(θ + π/2)

% 2. Sine wave আর Cosine wave এর amplitude, frequency, period কি ভাবে নির্ণয় করো?
% Answer:
% General form:
% A × sin(2πft) অথবা A × cos(2πft)
% A = Amplitude
% f = Frequency (Hz) → সেকেন্ডে কয়বার repeat হয়
% Period (T) = 1/f → এক পূর্ণ cycle সম্পন্ন করতে যত সময় লাগে

% 3. 2πft এখানে 2π এর ভূমিকা কি? ফ্রিকোয়েন্সি কিভাবে কাজ করে?
% Answer:
% 2π হল radian per cycle, কারণ 1 full cycle = 2π radian।
% তাই 2πf মানে প্রতি সেকেন্ডে total angular change বা ঘূর্ণন পরিমাণ।

% 4. Sampling frequency (fs) কেন প্রয়োজন? Nyquist theorem কি বলে?
% Answer:
% Sampling Frequency (fs) হল প্রতি সেকেন্ডে কতবার signal sample করা হবে।
% Nyquist Theorem অনুযায়ী fs ≥ 2 × f হতে হবে, নাহলে aliasing হবে এবং signal distorted দেখাবে।

% 5. t = 0:1/fs:1 — এখানে 1/fs কেন step size হিসেবে নেয়া হয়?
% Answer:
% 1/fs = sampling interval → প্রতিটি sample-এর মধ্যে time gap।
% যদি fs = 1000 হয় → প্রতি 0.001 sec পর sample নেয়া হচ্ছে।
% তাই 0:1/fs:1 দিলে পুরো 1 second এ proper sampling হয়।
% ========================================================================







