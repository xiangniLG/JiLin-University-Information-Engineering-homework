function DSPexp2_FFTcos(F,T,N,count)
%һ����ͬƵ�ʵ��źţ��Բ�ͬ������������������ķ���
%��T<=2*(1/F)�����������
n=1:N;
x=cos(2*pi*F*n*T);
figure(count);
subplot(4,1,1);plot(n,x);
title(['x(n) F= ',num2str(F),' T= ',num2str(T),' N= ',num2str(N)]);
xlabel('n');
X=fft(x);
magX=abs(X);
angX=angle(X);
subplot(4,1,2);plot(n,X);
title('X(N)');
xlabel('f(pi)');
subplot(4,1,3);plot(n,magX);
title('|FFT(x(n))|');
xlabel('f(pi)');
subplot(4,1,4);plot(n,angX);
title('angle(FFT(x(n)))');
xlabel('f(pi)');

