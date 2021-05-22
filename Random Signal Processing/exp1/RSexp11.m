%产生信号，计算指标
N=1024;
Fs=N;
len=512;
f=Fs*(0:len/2-1)/len;
signal1=rand(1,N);%均匀
signal1_2=5+10*rand(1,N);%均匀
signal1_3=5+rand(1,N);%均匀
signal2=randn(1,N);%高斯
signal3=exprnd(2,1,N);%指数，参数为2
signal4=raylrnd(2,1,N);%瑞利，均方值2

signal1_mean=mean(signal1);%均值
signal1_2_mean=mean(signal1_2);
signal1_3_mean=mean(signal1_3);
signal2_mean=mean(signal2);
signal3_mean=mean(signal3);
signal4_mean=mean(signal4);

signal1_var=var(signal1);%方差
signal1_2_var=var(signal1_2);
signal1_3_var=var(signal1_3);
signal2_var=var(signal2);
signal3_var=var(signal3);
signal4_var=var(signal4);

signal1_corr=xcorr(signal1);%自相关
signal2_corr=xcorr(signal2);
signal3_corr=xcorr(signal3);
signal4_corr=xcorr(signal4);

signal1_dens=unifpdf(signal1);%概率密度
signal1_2_dens=unifpdf(signal1_2);
signal1_3_dens=unifpdf(signal1_3);
% [k1,n1]=ksdensity(signal1);
% [k1_2,n1_2]=ksdensity(signal1_2);
% [k1_3,n1_3]=ksdensity(signal1_3);
[k2,n2]=ksdensity(signal2);
[k3,n3]=ksdensity(signal3);
[k4,n4]=ksdensity(signal4);

[signal1_power,w1_1]=periodogram(signal1);
[signal1_2_power,w1_2]=periodogram(signal1_2);
[signal1_3_power,w1_3]=periodogram(signal1_3);
[signal2_power,w2]=periodogram(signal2);
[signal3_power,w3]=periodogram(signal3);
[signal4_power,w4]=periodogram(signal4);

figure(1)
subplot(3,2,[1,2]);plot(signal1);title('原信号');xlabel('采样点');ylabel('采样值');
subplot(3,2,3);plot(-1023:1023,signal1_corr);title('原信号自相关');xlabel('m');
subplot(3,2,4);
axis([1,1500,-0.01,0.01]);
plot(signal1_dens/1024);
title('原信号概率密度');xlabel('采样值');ylabel('概率');
subplot(3,2,[5,6]);plot(signal1_power);title('原信号功率谱密度');xlabel('频率分量');ylabel('功率');

% figure(2)
% subplot(3,2,[1,2]);plot(signal1_2);title('原信号');xlabel('采样点');ylabel('采样值');
% subplot(3,2,3);plot(1:2047,signal1_2_corr);title('原信号自相关');xlabel('m');ylabel('幅度');
% subplot(3,2,4);
% % plot(n1_2,k1_2);
% plot(signal1_2_dens);
% title('原信号概率密度')
% subplot(3,2,[5,6]);plot(signal1_2_power);title('原信号功率谱密度')
% 
% figure(3)
% subplot(3,2,[1,2]);plot(signal1_3);title('原信号');xlabel('采样点');ylabel('采样值');
% subplot(3,2,3);plot(1:2047,signal1_3_corr);title('原信号自相关');xlabel('m');ylabel('幅度');
% subplot(3,2,4);
% % plot(n1_3,k1_3);
% plot(signal1_3_dens);
% title('原信号概率密度')
% subplot(3,2,[5,6]);plot(signal1_3_power);title('原信号功率谱密度')


figure(4)
subplot(3,2,[1,2]);plot(signal2);title('原信号');xlabel('采样点');ylabel('采样值');
subplot(3,2,3);plot(-1023:1023,signal2_corr);title('原信号自相关');xlabel('m');ylabel('幅度');
subplot(3,2,4);plot(n2,k2);title('原信号概率密度');xlabel('采样值');
subplot(3,2,[5,6]);plot(signal2_power);title('原信号功率谱密度');xlabel('频率分量');ylabel('功率');

figure(5)
subplot(3,2,[1,2]);plot(signal3);title('原信号');xlabel('采样点');ylabel('采样值');
subplot(3,2,3);plot(-1023:1023,signal3_corr);title('原信号自相关');xlabel('m');ylabel('幅度');
subplot(3,2,4);plot(n3,k3);title('原信号概率密度');xlabel('采样值');
subplot(3,2,[5,6]);plot(signal3_power);title('原信号功率谱密度');xlabel('频率分量');ylabel('功率');

figure(6)
subplot(3,2,[1,2]);plot(signal4);title('原信号');xlabel('采样点');ylabel('采样值');
subplot(3,2,3);plot(-1023:1023,signal4_corr);title('原信号自相关');xlabel('m');ylabel('幅度');
subplot(3,2,4);plot(n4,k4);title('原信号概率密度');xlabel('采样值');
subplot(3,2,[5,6]);plot(signal4_power);title('原信号功率谱密度');xlabel('频率分量');ylabel('功率');


