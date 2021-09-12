%%
% 1.Basic statistics
clc
load('300400bp.mat')
Fs=8000;
len=8192;
t=0:1/Fs:3-1/Fs;

f=Fs*(0:len/2-1)/len;
%%
% 2.Signal generate
y=randn(size(t));
y=filter(bandpass,1,y);

y_f=fft(y,len);
% figure(1)
% plot(y)
figure(2)
plot(f,abs(y_f(1:len/2)))
%%
% 3.Signal awgn
y=awgn(y,5);
y_real=add_bandpass_noise(y);
y1=y_real;
y2(1:50)=0.3*randn(1,50);
y2(1,51:length(t))=y1(1,1:length(t)-50);
y1_f=fft(y1,len);
y2_f=fft(y2,len);
% figure(3)
% subplot(2,1,1)
% plot(y1)
% subplot(2,1,2)
% plot(y2)
figure(4)
subplot(2,1,1)
plot(f,abs(y1_f(1:len/2)))
subplot(2,1,2)
plot(f,abs(y2_f(1:len/2)))
%%
% 4.xcorr
[max,time_delay,signalsXcorr] = calcu(y1,y2);
t_cor=1-length(signalsXcorr)/2:length(signalsXcorr)/2;
s=time_delay*(1/Fs)*340;
figure(5)
plot(t_cor,signalsXcorr);
axis([-500 300 -0.5 1])
%%
% 5.caculate
J=log2(Fs/100);
