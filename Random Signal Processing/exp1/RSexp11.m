%�����źţ�����ָ��
N=1024;
Fs=N;
len=512;
f=Fs*(0:len/2-1)/len;
signal1=rand(1,N);%����
signal1_2=5+10*rand(1,N);%����
signal1_3=5+rand(1,N);%����
signal2=randn(1,N);%��˹
signal3=exprnd(2,1,N);%ָ��������Ϊ2
signal4=raylrnd(2,1,N);%����������ֵ2

signal1_mean=mean(signal1);%��ֵ
signal1_2_mean=mean(signal1_2);
signal1_3_mean=mean(signal1_3);
signal2_mean=mean(signal2);
signal3_mean=mean(signal3);
signal4_mean=mean(signal4);

signal1_var=var(signal1);%����
signal1_2_var=var(signal1_2);
signal1_3_var=var(signal1_3);
signal2_var=var(signal2);
signal3_var=var(signal3);
signal4_var=var(signal4);

signal1_corr=xcorr(signal1);%�����
signal2_corr=xcorr(signal2);
signal3_corr=xcorr(signal3);
signal4_corr=xcorr(signal4);

signal1_dens=unifpdf(signal1);%�����ܶ�
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
subplot(3,2,[1,2]);plot(signal1);title('ԭ�ź�');xlabel('������');ylabel('����ֵ');
subplot(3,2,3);plot(-1023:1023,signal1_corr);title('ԭ�ź������');xlabel('m');
subplot(3,2,4);
axis([1,1500,-0.01,0.01]);
plot(signal1_dens/1024);
title('ԭ�źŸ����ܶ�');xlabel('����ֵ');ylabel('����');
subplot(3,2,[5,6]);plot(signal1_power);title('ԭ�źŹ������ܶ�');xlabel('Ƶ�ʷ���');ylabel('����');

% figure(2)
% subplot(3,2,[1,2]);plot(signal1_2);title('ԭ�ź�');xlabel('������');ylabel('����ֵ');
% subplot(3,2,3);plot(1:2047,signal1_2_corr);title('ԭ�ź������');xlabel('m');ylabel('����');
% subplot(3,2,4);
% % plot(n1_2,k1_2);
% plot(signal1_2_dens);
% title('ԭ�źŸ����ܶ�')
% subplot(3,2,[5,6]);plot(signal1_2_power);title('ԭ�źŹ������ܶ�')
% 
% figure(3)
% subplot(3,2,[1,2]);plot(signal1_3);title('ԭ�ź�');xlabel('������');ylabel('����ֵ');
% subplot(3,2,3);plot(1:2047,signal1_3_corr);title('ԭ�ź������');xlabel('m');ylabel('����');
% subplot(3,2,4);
% % plot(n1_3,k1_3);
% plot(signal1_3_dens);
% title('ԭ�źŸ����ܶ�')
% subplot(3,2,[5,6]);plot(signal1_3_power);title('ԭ�źŹ������ܶ�')


figure(4)
subplot(3,2,[1,2]);plot(signal2);title('ԭ�ź�');xlabel('������');ylabel('����ֵ');
subplot(3,2,3);plot(-1023:1023,signal2_corr);title('ԭ�ź������');xlabel('m');ylabel('����');
subplot(3,2,4);plot(n2,k2);title('ԭ�źŸ����ܶ�');xlabel('����ֵ');
subplot(3,2,[5,6]);plot(signal2_power);title('ԭ�źŹ������ܶ�');xlabel('Ƶ�ʷ���');ylabel('����');

figure(5)
subplot(3,2,[1,2]);plot(signal3);title('ԭ�ź�');xlabel('������');ylabel('����ֵ');
subplot(3,2,3);plot(-1023:1023,signal3_corr);title('ԭ�ź������');xlabel('m');ylabel('����');
subplot(3,2,4);plot(n3,k3);title('ԭ�źŸ����ܶ�');xlabel('����ֵ');
subplot(3,2,[5,6]);plot(signal3_power);title('ԭ�źŹ������ܶ�');xlabel('Ƶ�ʷ���');ylabel('����');

figure(6)
subplot(3,2,[1,2]);plot(signal4);title('ԭ�ź�');xlabel('������');ylabel('����ֵ');
subplot(3,2,3);plot(-1023:1023,signal4_corr);title('ԭ�ź������');xlabel('m');ylabel('����');
subplot(3,2,4);plot(n4,k4);title('ԭ�źŸ����ܶ�');xlabel('����ֵ');
subplot(3,2,[5,6]);plot(signal4_power);title('ԭ�źŹ������ܶ�');xlabel('Ƶ�ʷ���');ylabel('����');


