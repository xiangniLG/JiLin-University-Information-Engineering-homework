%�׹��ƵĲ�����ģ�ͷ���ʵ��
%����������ģ�ͣ�u(n)--H(z)--x(n)
%����˼·��1.��һ����������u(n)����һ������ϵͳH(z)�õ����x(n)
          %2.��x(n)����H(z)�Ĳ���
          %3.��H(z)�Ĳ�������x(n)�Ĺ�����
%AR��ȫ����ģ��
N =1024;
n = 1:N-1;
fi_1 = 2*pi*rand();%�����ʼ��λ1
fi_2 = 2*pi*rand();%��λ2
noise_power = 1;
e = noise_power*randn(size(n));%����һ������,��׼��Ϊ1(����Ϊ1)
y = 10*sin(0.24*pi*n+fi_1)+5*sin(0.26*pi*n+fi_2)+e;
p = 8;%8��
[pxx,w] = pyulear(y,p);%pΪARģ�ͽ״�/Yule-Walker AR������ɢʱ���ź�x���й����׹���,w�ķ�ΧΪ��0��pi��,
a = aryule(y,p);%�󼫵�/���aΪ���ƵĲ�����(��ĸ)
%disp('A(z)�Ĳ���Ϊ');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %��ϵͳƵ����Ӧ[0,2*pi]
figure(1)
subplot(311);
plot(w2(1:length(w2)/2)/pi,10*log10(mag(1:length(w2)/2).^2));
title(sprintf('%d�׷�����Ӧϵͳ��Ƶ����', p));
grid;
xlabel('��\piΪ��λ��Ƶ��');
ylabel('|����|');
axis([0 1 -50 50]);
ww = w/pi;
subplot(312);
pyulear(y,p,1024);%fft����1024
axis([0 1 -50 50]);
subplot(313)
window=hamming(length(y));
nfft=512;%��������
[Pxx,w]=periodogram(y,window,nfft);%����nfft��DFT�任�����nfft�����źų��ȣ���x���㵽����nfft����DFT�����nfftС���źų��ȣ�����źŽ���Ԥ������nfft���ȣ��ٶ԰������
plot(w/pi,10*log10(Pxx)),grid;axis([0 1 -50 50]);
xlabel('��\piΪ��λ��Ƶ��')
ylabel('�������ܶ�')
title('����ͼ������psd')

N =1024;
n = 1:N-1;
% fi_1 = 2*pi*rand(size(n));
% fi_2 = 2*pi*rand(size(n));
fi_1 = 2*pi*rand();
fi_2 = 2*pi*rand();
noise_power = 1;
e = noise_power*randn(size(n));%����һ��nά���������
y = 10*sin(0.24*pi*n+fi_1)+5*sin(0.26*pi*n+fi_2)+e;
p = 12;
[pxx,w] = pyulear(y,p);%pΪARģ�ͽ״� 
a = aryule(y,p);%�󼫵�
%disp('A(z)�Ĳ���Ϊ');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %��ϵͳƵ����Ӧ[0,2*pi]
figure(2)
subplot(311);
plot(w2(1:length(w2)/2)/pi,10*log10(mag(1:length(w2)/2).^2));
title(sprintf('%d�׷�����Ӧϵͳ��Ƶ����', p));
grid;
xlabel('��\piΪ��λ��Ƶ��');
ylabel('|����|');
axis([0 1 -50 50]);
ww = w/pi;
subplot(312);
pyulear(y,p,1024);axis([0 1 -50 50]);
%plot(ww,pxx);grid;title(sprintf('%d�׷�����Ӧ', p));xlabel('��\piΪ��λ��Ƶ��');ylabel('|����|');axis([0 1 -50 50]);
subplot(313)
window=hamming(length(y));
nfft=512;%��������
[Pxx,w]=periodogram(y,window,nfft);
% plot(w/pi,(Pxx)),grid;
plot(w/pi,10*log10(Pxx)),grid;axis([0 1 -50 50]);
xlabel('��\piΪ��λ��Ƶ��')
ylabel('�������ܶ�')
title('����ͼ������psd')

N =1024;
n = 1:N-1;
% fi_1 = 2*pi*rand(size(n));
% fi_2 = 2*pi*rand(size(n));
fi_1 = 2*pi*rand();
fi_2 = 2*pi*rand();
noise_power = 1;
e = noise_power*randn(size(n));%����һ��nά���������
y = 10*sin(0.24*pi*n+fi_1)+5*sin(0.26*pi*n+fi_2)+e;
p = 64;
[pxx,w] = pyulear(y,p);%pΪARģ�ͽ״� 
a = aryule(y,p);%�󼫵�
%disp('A(z)�Ĳ���Ϊ');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %��ϵͳƵ����Ӧ[0,2*pi]
figure(3)
p = 64;
[pxx,w] = pyulear(y,p);
a = aryule(y,p);
%disp('A(z)�Ĳ���Ϊ');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %��ϵͳƵ����Ӧ[0,2*pi]
subplot(311);plot(w2(1:length(w2)/2)/pi,10*log10(mag(1:length(w2)/2).^2));title(sprintf('%d�׷�����Ӧϵͳ��Ƶ����', p));grid;xlabel('��\piΪ��λ��Ƶ��');ylabel('|����|');axis([0 1 -50 50]);
ww = w/pi;
subplot(312);
pyulear(y,p,1024);axis([0 1 -50 50]);
 %plot(ww,pxx);grid;title(sprintf('%d�׷�����Ӧ', p));xlabel('��\piΪ��λ��Ƶ��');ylabel('|����|');
 subplot(313)
window=hamming(length(y));%hamming��
nfft=1024;
[Pxx,w]=periodogram(y,window,nfft);
% plot(w/pi,(Pxx)),grid;
plot(w/pi,10*log10(Pxx)),grid;axis([0 1 -50 50]);
xlabel('��\piΪ��λ��Ƶ��')
ylabel('�������ܶ�')
title('����ͼ������psd')