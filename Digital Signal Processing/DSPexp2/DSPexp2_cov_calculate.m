function DSPexp2_cov_calculate(x1,h1,count)
%���ڼ��������ȴ�Ƶ���ٷ��任
%������Ϊ32��
N=32;
X1=fft(x1,N);
H1=fft(h1,N);
Y1=X1.*H1;
y1=ifft(Y1);
figure(count);
stem(abs(y1));
title('������')
end



