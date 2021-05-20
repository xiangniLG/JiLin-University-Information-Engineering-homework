clear
clc
%高斯白噪声的产生与分析
%第一步：产生高斯白噪声信号
figure;
N=10000; %采样点数
global noise
noise=randn(1, N);
t=0:1/(N-1):1;
T=1/(N-1);%取样间隔
fs=1/T;%取样频率
subplot(5,1,1);
plot(t, noise);
ylabel('噪声幅值（V）');
xlabel('时间（t）');
title('高斯白噪声信号');
%第二步：对高斯白噪声信号进行分析

%计算信号均值
m=mean(noise);
%计算信号均方值
m_square=mean(noise.^2);
%计算信号方差
s=mean((noise-m).^2);
%求自相关函数
[r, lag]=xcorr(noise,'unbiased');
subplot(5,1,2);
plot(lag*T, r);
title('自相关函数');
%求高斯白噪声的概率密度
tt=-8:0.001:8;
f=exp(-(tt-m).^2/s)./(sqrt(2*pi*s));
subplot(5,1,3);
plot(tt, f);
title('高斯白噪声的概率分布曲线');
%求高斯白噪声的频谱

Noise=fft(noise, N);
cmo=abs(Noise);
subplot(5,1,4);
plot((0:N-1)*fs/N, cmo);
xlabel('频率（Hz）');
ylabel('幅值（V）');
title('白噪声信号频谱');%求高斯白噪声功率谱密度

fc=fft(r);
cm=abs(fc);
fl=(0:length(fc)-1)'*fs/length(fc);
subplot(5,1,5);
plot(fl, cm);
title('白噪声功率谱密度');


