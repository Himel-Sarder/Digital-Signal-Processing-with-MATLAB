clc;
close all;
clear;

n = -5:5;

% Ramp Signal r[n]
x = (n >= 0) .* n;   % শুধু n >= 0 হলে মান = n, অন্যসব জায়গায় 0 থাকে

figure;
stem(n, x, 'b', 'filled');          
xlabel('n');
ylabel('Amplitude');
title('Ramp Signal r[n]');
grid on;

% Ramp signal r[n] হল এমন একটি signal যেখানে n < 0 এ মান 0 এবং n >= 0 এ মান ধীরে ধীরে বৃদ্ধি পায় (r[n] = n).
% এটি সাধারণত একটি linearly increasing process বা gradual growth বোঝাতে ব্যবহার করা হয়।
