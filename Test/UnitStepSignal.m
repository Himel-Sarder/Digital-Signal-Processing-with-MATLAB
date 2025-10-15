clc;
close all;
clear;

n = -5:5;

% Unit Step Signal (u[n])
x = (n >= 0);   % এটি n >= 0 হলে 1 হবে, বাকিগুলো 0

figure;
stem(n, x, 'b', 'filled');          
xlabel('n');
ylabel('Amplitude');
title('Unit Step Signal u[n]');
grid on;

% Unit Step signal u[n] এমন একটি signal যেখানে n >= 0 এ মান 1 এবং n < 0 এ মান 0 থাকে।
% এটি প্রায় সকল digital signal processing সিস্টেমে activation বা ON হওয়ার সূচক হিসেবে ব্যবহৃত হয়।
