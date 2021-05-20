function DSPexp2_speed_comparision(N,count)
%���ڱȽ�DFT��FFT��ͬһ�źŴ�����ٶ�
F=50;
T=0.000635;
n=1:N;
x=cos(2*pi*F*n*T);
figure(count);
subplot(3,1,1);
stem(n,x);
title('x(n)');
xlabel('n');
%����DFTʱ��
fprintf('����Ϊ:%d\n',N);
fprintf('DFT��ʱ׼����ʼ...');
tic,
X=dft(x,N);
toc
%��ʾDFT���
magX=abs(X);
subplot(3,1,2);
stem(n,magX);
title('DFT|X| ��ɢ����Ҷ�任');
xlabel('f(pi)');
%����FFTʱ��
fprintf('����Ϊ:%d\n',N);
fprintf('FFT��ʱ׼����ʼ...');
tic,
X=fft(x,N);
toc
%��ʾFFT���
magfftX=abs(X);
subplot(3,1,3);
stem(n,magfftX);
title('DFT|X| ���ٸ���Ҷ�任');
xlabel('f(pi)');
end
