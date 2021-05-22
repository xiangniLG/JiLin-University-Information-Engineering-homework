%�˲�,����filterdisigner
load('realBandpassFilterof2khz.mat');
Fs=10000;
t=0:1/Fs:1;
len=1024;
f=Fs*(0:len/2-1)/len;
s1000=sin(2000*pi*t);%1000Hz����
s2000=sin(4000*pi*t);%2000Hz
s3000=sin(6000*pi*t);%3000Hz
s=s1000+s2000+s3000;
s=awgn(s,10);
filtered_Data = filter(Num,1,s);

s_f=abs(fft(s,len));
filtered_Data_f=abs(fft(filtered_Data,len));

s_mean=mean(s);%��ֵ
s_var=var(s);%������
s_cor=xcorr(s);%�����
[s_power,w]=periodogram(s);%������

f_mean=mean(filtered_Data);%��ֵ
f_var=var(filtered_Data);%������
f_cor=xcorr(filtered_Data);%�����
[f_power,w_1]=periodogram(f);%������

figure(1)
subplot(3,1,1);plot(s);axis([500 1000 -4 4]);title('ԭ�ź�');xlabel('ʱ��');ylabel('��ֵ');
subplot(3,1,2);plot(f,s_f(1:len/2));title('ԭ�ź�Ƶ��');xlabel('Ƶ�ʷ���');ylabel('��ֵ');
subplot(3,1,3);plot(f,filtered_Data_f(1:len/2));title('�˲����ź�Ƶ��');xlabel('Ƶ�ʷ���');ylabel('��ֵ');

figure(2)
subplot(2,1,1);plot(-10000:10000,s_cor);title('ԭ�ź������');xlabel('m');ylabel('����');
subplot(2,1,2);plot([0:8192]*10000/8192,s_power);title('ԭ�źŹ�����');xlabel('Ƶ�ʷ���');ylabel('��ֵ');

figure(3)
subplot(3,1,1);plot(filtered_Data);axis([500 1000 -1.5 1.5]);title('�˲����ź�');xlabel('ʱ��');ylabel('��ֵ');
subplot(3,1,2);plot(-10000:10000,f_cor);title('�˲����ź������');xlabel('m');ylabel('����');
subplot(3,1,3);plot([0:256]*10000/256,f_power);title('�˲����źŹ�����');xlabel('Ƶ�ʷ���');ylabel('��ֵ');




