function DSPexp2_cov_calculate(x1,h1,count)
%用于计算卷积。先打到频域，再反变换
%点数均为32点
N=32;
X1=fft(x1,N);
H1=fft(h1,N);
Y1=X1.*H1;
y1=ifft(Y1);
figure(count);
stem(abs(y1));
title('卷积结果')
end



