%滤波,用了filterdisigner
load('realBandpassFilterof2khz.mat');
Fs=10000;
t=0:1/Fs:1;
len=1024;
f=Fs*(0:len/2-1)/len;
s1000=sin(2000*pi*t);%1000Hz正弦
s2000=sin(4000*pi*t);%2000Hz
s3000=sin(6000*pi*t);%3000Hz
s=s1000+s2000+s3000;
s=awgn(s,10);
filtered_Data = filter(Num,1,s);

s_f=abs(fft(s,len));
filtered_Data_f=abs(fft(filtered_Data,len));

s_mean=mean(s);%均值
s_var=var(s);%均方差
s_cor=xcorr(s);%自相关
[s_power,w]=periodogram(s);%功率谱

f_mean=mean(filtered_Data);%均值
f_var=var(filtered_Data);%均方差
f_cor=xcorr(filtered_Data);%自相关
[f_power,w_1]=periodogram(f);%功率谱

figure(1)
subplot(3,1,1);plot(s);axis([500 1000 -4 4]);title('原信号');xlabel('时间');ylabel('样值');
subplot(3,1,2);plot(f,s_f(1:len/2));title('原信号频谱');xlabel('频率分量');ylabel('幅值');
subplot(3,1,3);plot(f,filtered_Data_f(1:len/2));title('滤波后信号频谱');xlabel('频率分量');ylabel('幅值');

figure(2)
subplot(2,1,1);plot(-10000:10000,s_cor);title('原信号自相关');xlabel('m');ylabel('幅度');
subplot(2,1,2);plot([0:8192]*10000/8192,s_power);title('原信号功率谱');xlabel('频率分量');ylabel('幅值');

figure(3)
subplot(3,1,1);plot(filtered_Data);axis([500 1000 -1.5 1.5]);title('滤波后信号');xlabel('时间');ylabel('样值');
subplot(3,1,2);plot(-10000:10000,f_cor);title('滤波后信号自相关');xlabel('m');ylabel('幅度');
subplot(3,1,3);plot([0:256]*10000/256,f_power);title('滤波后信号功率谱');xlabel('频率分量');ylabel('幅值');




