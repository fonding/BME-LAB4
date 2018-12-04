%% design a notch filter
global SampleRate_t Acqtime_t
fs = SampleRate_t;
f_nyquist = fs/2; % nyquist frenqucy is a half of the sample rate
fl = 48; % low cutoff frequency of the notch(bandstop) filter
fh = 52; % high cutoff frequency of the notch filter

[b,a] = butter(4,[fl/f_nyquist,fh/f_nyquist],'stop'); % butterworth filter design
        % filter order = 4,
        % [fl/f_nyquist,fh/f_nyquist] are the normalized cutoff frequencies
        % 'stop' means it's a bandstop filter
        % the output b,a represent the filter (system)
%figure; freqz(b,a,SampleRate_t*Acqtime_t); % the frequency response of the filter; 
        % 4000 is the number of points in the response curves,you can change
        % it,or just leave it empty to get a default 512
%% apply the filter
%V5 = xlsread('byh_ECG_data.xlsx','sheet1','b1:b2500');
%V5 = V5-mean(V5); % eliminate the DC component in V5
m2 = filter(b,a,m1);  % filter data V5;
%N = length(V5); 
%n = 0:N-1; % sample count sequence
%df = n*fs/N; % frequency sequence corresponding to FFT
%figure;subplot(211); plot(df,abs(fft(V5))); axis([0,fs,ylim]);
%xlabel('Frequency (Hz)'); ylabel('|FT| amplitude');title('original sig') ;
%subplot(212);plot(df,abs(fft(filtsig))); axis([0,fs,ylim]);
%xlabel('Frequency (Hz)'); ylabel('|FT| amplitude'); title('filtered sig');
%t = n/fs; % time sequence
%figure; plot(t,[V5,filtsig]);legend('original','filtered');
%xlabel('Time (s)');ylabel('Signal amplitude (V)');
base_f;
%work_f;