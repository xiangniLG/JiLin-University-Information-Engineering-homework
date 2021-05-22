%读txt,转mat,分析
signal=load('20181027_01.txt');
Fs=length(signal);%读入长度
fs=Fs/30;
len=512;
f=Fs*(0:len/2-1)/len;

t1=0:1/fs:(5-1/fs);
t2=0:1/fs:(15-1/fs);
t3=0:1/fs:(30-1/fs);

signal_mean=mean(signal);
signal_var=var(signal);
signal_cor=xcorr(signal);
signal_fft=abs(fft(signal,len));
[signal_power,w1]=periodogram(signal);

% signal_power=abs(fft(signal_cor));

% figure(1)
% subplot(2,2,1);plot(1-Fs:Fs-1,signal_cor);
% % xlabel('m');
% subplot(2,2,2);plot(signal_power);
% % axis([0 500 0 800000000]);xlabel('频率分量');ylabel('功率幅值');
% subplot(2,2,[3,4]);plot(f,signal_fft(1:len/2));
% % plot(f,signal_fft(len/2+1:len))
% 
figure(2)
plot(signal);
% axis([1000 3000 0 60000])

load('3-5lowpass.mat');
Num1=Num;
load('40-160bandpass.mat');
Num2=Num;

signal_breath=filter(Num1,1,signal);
signal_bump=filter(Num2,1,signal);

figure(3)
subplot(2,1,1)
plot(signal_breath)
axis([500 4000 25000 50000])
subplot(2,1,2);
plot(signal_bump);
axis([2000 3000 -40000 40000])
% axis([1500 3000 -40000 40000])

% % 截取
% signal_5s=signal(1:length(t1));
% signal_15s=signal(1:length(t2));
% signal_30s=signal;
% 
% figure(4)
% histfit(signal_5s);
% figure(5)
% histfit(signal_15s);
% figure(6)
% histfit(signal_30s);
% 
% signal_5s=signal(1000:1000+length(t1));
% signal_15s=signal(1000:1000+length(t2));
% 
% signal_5s_breath=filter(Num1,1,signal_5s);
% signal_5s_bump=filter(Num2,1,signal_5s);
% 
% signal_15s_breath=filter(Num1,1,signal_15s);
% signal_15s_bump=filter(Num2,1,signal_15s);
% 
% figure(7)
% subplot(2,2,1);plot(signal_5s_breath);
% subplot(2,2,2);plot(signal_5s_bump);
% subplot(2,2,3);plot(signal_15s_breath);
% subplot(2,2,4);plot(signal_15s_bump);axis([200 700 -15000 15000])


