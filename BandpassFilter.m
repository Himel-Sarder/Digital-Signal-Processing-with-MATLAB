clc;
close all;
clear all;

% Sampling setup
t = 0 : 1 : 400;      % Sample index (401 points)
fs = 100;             % Sampling frequency (100 Hz)

% Signal components
f1 = 10;  
x1 = 4*sin(2*pi*f1/fs*t);

f2 = 15;  
x2 = 4*sin(2*pi*f2/fs*t);

f3 = 20;  
x3 = 4*sin(2*pi*f3/fs*t);

f4 = 30;  
x4 = 4*sin(2*pi*f4/fs*t);

% Composite signal
s = x1 + x2 + x3 + x4;





% ---------- FFT BEFORE FILTER ----------



L = length(s);                  % Signal length
NFFT = 2^nextpow2(L);           % Next power of 2 (for efficient FFT)

% --------------------------------------------------------------------
% ধাপ ১: FFT করার পর কী পাওয়া যায়?
% ধরো, তোমার সিগন্যাল হলো:
% s = [1 2 3 4];

% FFT করার পর:
% X = fft(s);

% X এর আউটপুট হবে complex সংখ্যা:
% X = [10.0000  -2.0000+2.0000i  -2.0000  -2.0000-2.0000i]
% এখানে প্রতিটি X(k) হলো একটি frequency component-এর complex মান।

% ---------------------------------------------
% ধাপ ২: Magnitude (Amplitude) বের করা
% ফ্রিকোয়েন্সি অনুযায়ী amplitude দেখতে হলে complex মান থেকে modulus নিতে হবে:
% abs(X)

% এর মান হবে:
% abs(X) = [10  2.8284  2  2.8284]
% অর্থাৎ, প্রতিটি ফ্রিকোয়েন্সির বাস্তব শক্তি (amplitude)।

% ---------------------------------------------
% ধাপ ৩: Normalization (L দিয়ে ভাগ করা)
% FFT-এর পরে abs(X) মান বড় হয়ে যায় কারণ সব sample একসাথে যোগ হয়।
% মূল সিগন্যালের সঠিক amplitude পেতে সেটাকে signal length L দিয়ে ভাগ করা হয়:
% P2 = abs(X/L);

% এখানে:
% abs(X) -> FFT-এর magnitude
% /L     -> normalization, মূল সিগন্যালের স্কেল ঠিক রাখতে

% ---------------------------------------------
% ধাপ ৪: উদাহরণসহ
% s = [1 2 3 4];
% L = length(s);    % L = 4
% X = fft(s);

% এখন normalized magnitude বের করা
% P2 = abs(X/L);

% মান হবে:
% P2 = abs([10  -2+2i  -2  -2-2i]/4)
% P2 = [2.5  0.7071  0.5  0.7071]

% এই P2 মানগুলো হলো মূল amplitude স্কেলে
% এটি হলো two-sided amplitude spectrum (positive ও negative frequency দুই দিকেই)
% -------------------------------------------------------------------





X = fft(s, NFFT);               % Compute FFT
% --------------------------------------------------------------------
% এই কমান্ড FFT অ্যালগরিদম ব্যবহার করে তোমার সিগন্যাল s-কে frequency domain-এ রূপান্তর করছে।

% অর্থাৎ এটি বের করছে —
% s এর মধ্যে কোন কোন ফ্রিকোয়েন্সি আছে
% সেই ফ্রিকোয়েন্সিগুলোর অ্যামপ্লিটিউড (strength) কত।

% fft(s) -> FFT করে সিগন্যালের নিজস্ব দৈর্ঘ্যে
% fft(s, NFFT) -> FFT করে power-of-2 দৈর্ঘ্যে (দ্রুত ও নির্ভুলভাবে)
% --------------------------------------------------------------------






P2 = abs(X/L);

% ---------------------------------------------
% ধাপ ১: FFT করার পর কী পাওয়া যায়?
% ধরো, তোমার সিগন্যাল হলো:
% s = [1 2 3 4];

% FFT করার পর:
% X = fft(s);

% X এর আউটপুট হবে complex সংখ্যা:
% X = [10.0000  -2.0000+2.0000i  -2.0000  -2.0000-2.0000i]
% এখানে প্রতিটি X(k) হলো একটি frequency component-এর complex মান।

% ---------------------------------------------
% ধাপ ২: Magnitude (Amplitude) বের করা
% ফ্রিকোয়েন্সি অনুযায়ী amplitude দেখতে হলে complex মান থেকে modulus নিতে হবে:
% abs(X)

% এর মান হবে:
% abs(X) = [10  2.8284  2  2.8284]
% অর্থাৎ, প্রতিটি ফ্রিকোয়েন্সির বাস্তব শক্তি (amplitude)।

% ---------------------------------------------
% ধাপ ৩: Normalization (L দিয়ে ভাগ করা)
% FFT-এর পরে abs(X) মান বড় হয়ে যায় কারণ সব sample একসাথে যোগ হয়।
% মূল সিগন্যালের সঠিক amplitude পেতে সেটাকে signal length L দিয়ে ভাগ করা হয়:
% P2 = abs(X/L);

% এখানে:
% abs(X) -> FFT-এর magnitude
% /L     -> normalization, মূল সিগন্যালের স্কেল ঠিক রাখতে

% ---------------------------------------------
% ধাপ ৪: উদাহরণসহ
% s = [1 2 3 4];
% L = length(s);    % L = 4
% X = fft(s);

% এখন normalized magnitude বের করা
% P2 = abs(X/L);

% মান হবে:
% P2 = abs([10  -2+2i  -2  -2-2i]/4)
% P2 = [2.5  0.7071  0.5  0.7071]

% এই P2 মানগুলো হলো মূল amplitude স্কেলে
% এটি হলো two-sided amplitude spectrum (positive ও negative frequency দুই দিকেই)
% --------------------------------------------------------------------






P1 = P2(1:NFFT/2+1);       

% --------------------------------------------------------------------
% P2 = [2.625 1.2071 0.5 0.2071 0.125 0.2071 0.5 1.2071]

% এখানে P2 হলো two-sided spectrum:
% প্রথম অংশ → positive frequency (0 Hz থেকে Nyquist)
% শেষ অংশ → negative frequency

% P2 = [DC, +f1, +f2, ..., Nyquist, -f2, -f1]

% Positive frequency বের করা

% P1 = P2(1:NFFT/2+1);
% NFFT/2 + 1 = 8/2 + 1 = 5

% অর্থাৎ প্রথম 5 element নিলে আমরা পাব positive frequency spectrum:
% P1 = [2.625 1.2071 0.5 0.2071 0.125]

% এটি হলো single-sided amplitude spectrum, যা শুধু positive frequencies দেখায়।
% --------------------------------------------------------------------






P1(2:end-1) = 2*P1(2:end-1);    % Double except DC and Nyquist

% --------------------------------------------------------------------
% এখন আমরা negative অংশ বাদ দিয়েছি,
% তাই যেন amplitude কমে না যায়, এজন্য positive দিকের energy-কে দুই গুণ (×2) করা হয়।

% P1(2:end-1) = 2 * P1(2:end-1);


% এখানে:

% P1(2:end-1) মানে হলো DC component (index 1) ও Nyquist frequency বাদে বাকি সব frequency।

% কারণ DC ও Nyquist frequency-এর mirror pair থাকে না, তাই এগুলোকে ২ দিয়ে গুণ করা হয় না।

% --------------------------------------------------------------------


f = fs*(0:(NFFT/2))/NFFT;       % Frequency axis

% --------------------------------------------------------------------
% ধরা যাক তোমার সিগন্যালের sampling frequency (fs) হলো 100 Hz
% fs = 100;      

% FFT এর জন্য NFFT নেওয়া হলো 8
% NFFT = 8;      

% এখন frequency ভেক্টর তৈরি করা হবে
% -------------------------------------------
% (0:(NFFT/2)) মানে হলো 0 থেকে NFFT/2 পর্যন্ত index তৈরি করা
% যেমন এখানে হবে [0 1 2 3 4]
%
% fs / NFFT মানে হলো প্রতিটি ধাপে কত Hz করে frequency বাড়বে
% 
% তাই fs * (0:(NFFT/2)) / NFFT করলে
% প্রতিটি index-কে frequency মানে রূপান্তর করে ফেলা যায়
%
% অর্থাৎ:
% f = fs * (index) / NFFT
% যেখানে index = 0, 1, 2, ..., NFFT/2
%
% ফলে আমরা শুধুমাত্র positive frequency দিকটা পাই (0 থেকে fs/2 পর্যন্ত)
% -------------------------------------------

% f = fs * (0:(NFFT/2)) / NFFT;

% এখন মান হবে:
% f = 100 * [0 1 2 3 4] / 8
% f = [0 12.5 25 37.5 50]

% অর্থাৎ এই f ভেক্টরটি frequency axis নির্দেশ করছে,
% যেখানে প্রতিটি মানে FFT থেকে প্রাপ্ত amplitude (P1) দেখানো যায়।
% --------------------------------------------------------------------






subplot(2,1,1);
plot(f, P1, 'b', 'LineWidth', 1.2);
title('Single-Sided Amplitude Spectrum of s(t)');
xlabel('Frequency (Hz)');
ylabel('|Amplitude|');
grid on;




% ---------- BUTTERWORTH BANDPASS FILTER ----------
filterdata = Bandpass_FilterFUNCTION(s);




% ---------- FFT AFTER FILTER ----------
L = length(filterdata);
NFFT = 2^nextpow2(L);
X = fft(filterdata, NFFT);
P2 = abs(X/L);
P1 = P2(1:NFFT/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(NFFT/2))/NFFT;

subplot(2,1,2);
plot(f, P1, 'r', 'LineWidth', 1.2);
title('Single-Sided Amplitude Spectrum after Bandpass Filter');
xlabel('Frequency (Hz)');
ylabel('|Amplitude|');
grid on;
