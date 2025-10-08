% Bandpass Filter Function
function filteredData = Bandpass_Filter(inputData)
    sampleRate = 100; % Hz
    lowEnd = 13;      % Hz
    highEnd = 25;     % Hz
    filterOrder = 2;  % Filter order
    [b, a] = butter(filterOrder, [lowEnd highEnd]/(sampleRate/2)); 
    filteredData = filtfilt(b, a, inputData); 
end


% -------------------------------------------------------------------------
% Butterworth Bandpass Filter Design Explanation
% ---------------------------------------------------------------------

% butter() হলো MATLAB-এর Butterworth filter designer।
% এটা নির্দিষ্ট cutoff frequency অনুযায়ী একটি
% Lowpass, Highpass, Bandpass, বা Bandstop ফিল্টার তৈরি করতে ব্যবহৃত হয়।

% Butterworth filter-এর বৈশিষ্ট্য:
% ➤ Frequency response একদম smooth হয় (কোনো ripple বা কম্পন থাকে না)
% ➤ Unwanted frequency গুলো খুব সুন্দরভাবে কেটে দেয়

% -------------------------------------------------------------------------
% ধাপে ধাপে ব্যাখ্যা
% ---------------------------------------------------------------------

% 1️ Filter Order নির্ধারণ
% filterOrder = 2;  
% এর মানে হলো আমরা 2nd order Butterworth filter বানাচ্ছি।
% অর্ডার যত বেশি হবে, ফিল্টার তত বেশি তীক্ষ্ণভাবে (sharp cutoff) কাজ করবে।

% 2️ Bandpass রেঞ্জ নির্ধারণ
% lowEnd = 13;   % নিম্ন cutoff frequency (Hz)
% highEnd = 25;  % উচ্চ cutoff frequency (Hz)
% মানে হলো, আমরা 13 Hz থেকে 25 Hz পর্যন্ত ফ্রিকোয়েন্সি রাখতে চাই,
% আর এর বাইরের ফ্রিকোয়েন্সিগুলো বাদ দিতে চাই।

% 3️ Sampling Frequency
% sampleRate = 100;  % Hz
% প্রতি সেকেন্ডে 100টি sample নেওয়া হচ্ছে।

% 4️ Nyquist Frequency
% FFT বা Filter ডিজাইনে সব ফ্রিকোয়েন্সিকে normalize করতে হয় Nyquist frequency দিয়ে।
% Nyquist frequency = sampleRate / 2 = 100 / 2 = 50 Hz

% 5️ Normalized Frequency
% MATLAB-এর butter() ফাংশন Hz মান নেয় না — 0 থেকে 1-এর মধ্যে normalized মান নেয়।
% [lowEnd highEnd] / (sampleRate/2) করলে আমরা normalized cutoff frequency পাই।
% উদাহরণ: [13 25]/50 = [0.26 0.5]
% অর্থাৎ, ফিল্টার 13 Hz থেকে 25 Hz পর্যন্ত ফ্রিকোয়েন্সি পাস করবে।


% 6️ Filter Design
% [b, a] = butter(filterOrder, [lowEnd highEnd]/(sampleRate/2));
% এই লাইনটি একটি 2nd order Bandpass Butterworth Filter ডিজাইন করে।
% এখানে:
%     b → numerator coefficients (filter numerator)
%     a → denominator coefficients (filter denominator)


% 7️ উদাহরণ (MATLAB আউটপুট কেমন হয়)
% [b, a] = butter(2, [13 25]/(100/2));
% b = [ 0.1751    0    -0.1751 ];
% a = [ 1.0000   -1.1648    0.6498 ];

% এই b এবং a মানগুলো filter equation-এর coefficient হিসেবে কাজ করে।


% 8️ Filter প্রয়োগ করা
% filtfilt() ফাংশন forward এবং backward দুই দিকেই filtering করে।
% এর ফলে phase distortion হয় না (signal-এর waveform shift হয় না)।
% তাই filtered signal clean ও symmetrical থাকে।
% উদাহরণ:
% filteredData = filtfilt(b, a, inputData);

% ---------------------------------------------------------------------
