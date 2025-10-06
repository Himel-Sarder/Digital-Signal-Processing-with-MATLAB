n = 0:5;
a = 0.8;
x = a.^n;
stem(n, x, 'filled');
xlabel('n'); 
ylabel('Amplitude');
title('Exponential Signal x[n] = 0.8^n');
