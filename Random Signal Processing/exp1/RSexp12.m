%��˹������
N=1024;
n=randn(1,N);
n_mean=mean(n);%��ֵ
n_var=var(n);%������
n_cor=xcorr(n);%�����
n_fft=abs(fft(n));%Ƶ��
% n_dens=abs(fft(n_cor));%������
[n_dens,w]=periodogram(n);

subplot(3,1,1);plot(n);title('��˹������ʱ���ź�');xlabel('��������');ylabel('����ֵ');
subplot(3,1,2);plot(n_fft);title('��˹������Ƶ��');xlabel('Ƶ�ʷ���');ylabel('��ֵ');
subplot(3,1,3);plot(n_dens);xlabel('����ֵ');
