clc;                  % Command Window পরিষ্কার করে — পুরানো output মুছে ফেলে
clear;                % Workspace থেকে আগের সব variables মুছে ফেলে
close all;            % আগের সব figure window বন্ধ করে


fs = 1000;            % প্রতি সেকেন্ডে কয়টা sample নেওয়া হবে (Sampling Frequency = 1000 Hz)
t = 0:1/fs:1;         % 0 থেকে 1 সেকেন্ড পর্যন্ত সময়কে ছোট ছোট step-এ ভাগ করে (Time vector তৈরি করে)
f1 = 50;              % প্রথম সাইন তরঙ্গের ফ্রিকোয়েন্সি ৫০ Hz
f2 = 150;             % দ্বিতীয় সাইন তরঙ্গের ফ্রিকোয়েন্সি ১৫০ Hz
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);  
                      % দুটি সাইন তরঙ্গ যোগ করা হলো — ২য়টার amplitude অর্ধেক


subplot(2,1,1);       % Figure-কে ২ ভাগে ভাগ করলো — এটা প্রথম প্লট (উপরের অংশ)
plot(t, x, 'LineWidth', 1.5); % Time-domain signal প্লট করা হলো
title('Time Domain Signal');  % উপরে শিরোনাম লেখা
xlabel('Time (s)');           % X-axis এ "Time (s)" লেখা
ylabel('Amplitude');          % Y-axis এ "Amplitude" লেখা
grid on;                      % প্লটে গ্রিড দেখানো হচ্ছে — পড়তে সুবিধা হয়


% FFT
N = length(x);        % সিগন্যালের মোট কতগুলো sample আছে তা বের করা

NFFT = 2^nextpow2(N); % FFT করার জন্য নিকটের 2^n সাইজ নেয়া — এতে FFT দ্রুত হয় (Zero Padding হয়)

X = fft(x, NFFT);             % MATLAB-এর built-in FFT ফাংশন ব্যবহার করে ফ্রিকোয়েন্সি ডোমেইনে রূপান্তর

f = (0:(NFFT/2)-1)*(fs/NFFT);       % Frequency axis তৈরি করা হলো — ০ থেকে fs/2 পর্যন্ত positive frequency

magX = abs(X);        % FFT complex মান দেয় — abs() দিয়ে Magnitude নেওয়া হলো      

mag = magX(1:NFFT/2); % FFT ফলাফলের শুধু প্রথম অর্ধেক রাখা হলো — কারণ বাকিটা Duplicate (Negative freq)

subplot(2,1,2);       % Figure-এর দ্বিতীয় অংশে প্লট করার প্রস্তুতি
plot(f, mag, 'LineWidth', 1.5); % Frequency domain magnitude প্লট
title('Frequency Domain (FFT Result)'); % শিরোনাম
xlabel('Frequency (Hz)');      % X-axis লেবেল
ylabel('Magnitude');           % Y-axis লেবেল
xlim([0 fs/2]);                % 0 থেকে Half sampling rate (Nyquist limit) পর্যন্ত দেখানো
grid on;                       % গ্রিড অন করা — স্পষ্ট বুঝতে



%% Another way      ======> Two-Sided Spectrum + xlim([0 fs/2])
clc;
clear;
close all;

% Time domain signal
fs = 1000;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f1 = 50;                % Frequency component 1
f2 = 150;               % Frequency component 2
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);  % Composite signal

subplot(2,1,1);
plot(t, x, 'LineWidth', 1.5);
title('Time Domain Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% FFT
N = length(x);          % Number of samples

NFFT = 2^nextpow2(N);

X = fft(x, NFFT);             % Built-in FFT function

f = 0:NFFT-1;     % Frequency axis

magX = abs(X);

% Magnitude Spectrum
subplot(2,1,2);
plot(f, magX, 'LineWidth', 1.5);
title('Frequency Domain (FFT Result)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 fs/2]);      % Show only positive frequencies
grid on;
