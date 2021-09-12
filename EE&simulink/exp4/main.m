%fdatool/filterdesigner
load('40-130bandpass.mat')
Fs=500;
len=4096;
t=0:1/Fs:1;
f=Fs*(0:len/2-1)/len;
x=sin(100*pi*t)+sin(240*pi*t);
noise=2*randn(1,length(t));
signal=x+noise;
x_f=fft(x,len);
signal_f=fft(signal,len);
% plot(t,x,'b',t,signal,'r');
figure(1)
subplot(2,1,1);
plot(t,x);
axis([0 0.5 -3 3]);
subplot(2,1,2);
plot(f,abs(x_f(1:len/2)));

% figure(2)
% subplot(2,1,1);
% plot(t,signal);
% axis([0 0.5 -7 7]);
% subplot(2,1,2);
% plot(f,abs(signal_f(1:len/2)));

% % IIR滤波器设计  
% N=0; % 阶数  
% W=0:0.01:2; 
% Wp=[40 120]/250;%通带
% Ws=[30 130]/250;%阻带
% Rp=3;%通带衰减
% Rs=60;%阻带衰减
% [N,Wn]=cheb2ord(Wp,Ws,Rp,Rs,'s');%求切比雪夫II型滤波器阶数
% [bc,ac]=cheby2(N,Rs,Wn,'bandpass','s');%求切比雪夫II型滤波器系数
% [Hc,wc]=freqs(bc,ac,W);%求切比雪夫II型滤波器频率响应
% figure(2)
% plot(wc/pi,20*log10(abs(Hc)),'r');%作图
% 
% % 滤波
% signal_filtered=filter(bc,ac,signal);
% signal_filtered_f=fft(signal_filtered,len);
% figure(3);
% subplot(2,1,1);
% plot(f,abs(signal_f(1:len/2)));
% subplot(2,1,2);
% plot(f,abs(signal_filtered_f(1:len/2)));

% % 使用滤波器设计功能设计的滤波器滤波
% signal_filtered=filter(Num,1,signal);
% signal_filtered_f=fft(signal_filtered,len);
% figure(4);
% subplot(2,1,1);
% plot(f,abs(signal_f(1:len/2)));
% subplot(2,1,2);
% plot(f,abs(signal_filtered_f(1:len/2)));

% FIR:先带通，再带阻
fc1 =44 ;
fc2 =126 ;
[n,Wn,beta,ftype]=kaiserord([40 48 122 130],[0 1 0],[0.01 0.01 0.01],Fs);
w1=2*fc1/Fs; w2=2*fc2/Fs;% 将模拟技术指标转换为数字技术指标
window_bandpass=kaiser(n+1,beta);% 使用 kaiser 窗函数
b_bandpass=fir1(n,[w1 w2],window_bandpass); %使用标准频率响应的加窗设计函数 fir1
signal_filtered1=filter(b_bandpass,1,signal);
signal_f_fft1=fft(signal_filtered1,len);

% figure(5)
% subplot(2,1,1);
% plot(t,signal_filtered1);
% % axis([0.25 0.75 -7 7]);
% subplot(2,1,2);
% plot(f,abs(signal_f_fft1(1:len/2)));

%FIR带阻
Wn_stop=[0.21 0.47];
N=100;
window_stop=kaiser(N+1);
b_stop=fir1(N,Wn_stop,'stop',window_stop);
% freqz(b_stop,1,1024,500);
signal_clean=filter(b_stop,1,signal_filtered1);
signal_f_fft2=fft(signal_clean,len);

figure(6)
subplot(2,1,1);
plot(t,signal_clean);
axis([0.45 0.85 -3 3]);
subplot(2,1,2);
plot(f,abs(signal_f_fft2(1:len/2)));

%信噪比
snr1=SNR(x,signal);
snr2=SNR(x,signal_clean);

%均方误差
errormse=mse(signal_clean-x);



