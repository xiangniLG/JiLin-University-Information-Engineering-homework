function DSPexp2_speed_comparision(N,count)
%用于比较DFT与FFT对同一信号处理的速度
F=50;
T=0.000635;
n=1:N;
x=cos(2*pi*F*n*T);
figure(count);
subplot(3,1,1);
stem(n,x);
title('x(n)');
xlabel('n');
%测试DFT时间
fprintf('点数为:%d\n',N);
fprintf('DFT计时准备开始...');
tic,
X=dft(x,N);
toc
%显示DFT结果
magX=abs(X);
subplot(3,1,2);
stem(n,magX);
title('DFT|X| 离散傅里叶变换');
xlabel('f(pi)');
%测试FFT时间
fprintf('点数为:%d\n',N);
fprintf('FFT计时准备开始...');
tic,
X=fft(x,N);
toc
%显示FFT结果
magfftX=abs(X);
subplot(3,1,3);
stem(n,magfftX);
title('DFT|X| 快速傅里叶变换');
xlabel('f(pi)');
end
