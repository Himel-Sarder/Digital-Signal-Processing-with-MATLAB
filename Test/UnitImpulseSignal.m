clc;
close all;
clear;

n = -5:5;

% Unit Impulse Signal (delta function)
x = (n == 0);   % এটি n = 0 তে 1 হবে, বাকিগুলো 0

figure;
stem(n, x, 'r', 'filled');          
xlabel('n');
ylabel('Amplitude');
title('Unit Impulse Signal δ[n]');
grid on;

% Unit impulse δ[n] এমন একটি theoretical signal যা শুধুমাত্র n=0 তে 1 এবং বাকি সব জায়গায় 0 থাকে। 
% এটি LTI সিস্টেমের response বের করতে এবং convolution analysis এ standard test input হিসেবে ব্যবহার করা হয়।"
