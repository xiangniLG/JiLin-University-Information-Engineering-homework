clear
clc
%��˹�������Ĳ��������
%��һ����������˹�������ź�
figure;
N=10000; %��������
global noise
noise=randn(1, N);
t=0:1/(N-1):1;
T=1/(N-1);%ȡ�����
fs=1/T;%ȡ��Ƶ��
subplot(5,1,1);
plot(t, noise);
ylabel('������ֵ��V��');
xlabel('ʱ�䣨t��');
title('��˹�������ź�');
%�ڶ������Ը�˹�������źŽ��з���

%�����źž�ֵ
m=mean(noise);
%�����źž���ֵ
m_square=mean(noise.^2);
%�����źŷ���
s=mean((noise-m).^2);
%������غ���
[r, lag]=xcorr(noise,'unbiased');
subplot(5,1,2);
plot(lag*T, r);
title('����غ���');
%���˹�������ĸ����ܶ�
tt=-8:0.001:8;
f=exp(-(tt-m).^2/s)./(sqrt(2*pi*s));
subplot(5,1,3);
plot(tt, f);
title('��˹�������ĸ��ʷֲ�����');
%���˹��������Ƶ��

Noise=fft(noise, N);
cmo=abs(Noise);
subplot(5,1,4);
plot((0:N-1)*fs/N, cmo);
xlabel('Ƶ�ʣ�Hz��');
ylabel('��ֵ��V��');
title('�������ź�Ƶ��');%���˹�������������ܶ�

fc=fft(r);
cm=abs(fc);
fl=(0:length(fc)-1)'*fs/length(fc);
subplot(5,1,5);
plot(fl, cm);
title('�������������ܶ�');


