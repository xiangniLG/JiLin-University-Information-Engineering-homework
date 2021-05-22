%高斯白噪声
N=1024;
n=randn(1,N);
n_mean=mean(n);%均值
n_var=var(n);%均方差
n_cor=xcorr(n);%自相关
n_fft=abs(fft(n));%频谱
% n_dens=abs(fft(n_cor));%功率谱
[n_dens,w]=periodogram(n);

subplot(3,1,1);plot(n);title('高斯白噪声时域信号');xlabel('采样点数');ylabel('采样值');
subplot(3,1,2);plot(n_fft);title('高斯白噪声频谱');xlabel('频率分量');ylabel('幅值');
subplot(3,1,3);plot(n_dens);xlabel('采样值');
