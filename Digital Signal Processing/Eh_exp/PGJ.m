%谱估计的参数化模型方法实验
%参数功率谱模型：u(n)--H(z)--x(n)
%基本思路：1.由一个输入序列u(n)激励一个线性系统H(z)得到输出x(n)
          %2.由x(n)估计H(z)的参数
          %3.由H(z)的参数估计x(n)的功率谱
%AR是全极点模型
N =1024;
n = 1:N-1;
fi_1 = 2*pi*rand();%随机初始相位1
fi_2 = 2*pi*rand();%相位2
noise_power = 1;
e = noise_power*randn(size(n));%返回一个噪声,标准差为1(方差为1)
y = 10*sin(0.24*pi*n+fi_1)+5*sin(0.26*pi*n+fi_2)+e;
p = 8;%8阶
[pxx,w] = pyulear(y,p);%p为AR模型阶次/Yule-Walker AR法对离散时间信号x进行功率谱估计,w的范围为［0，pi］,
a = aryule(y,p);%求极点/输出a为估计的参数。(分母)
%disp('A(z)的参数为');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %求系统频率响应[0,2*pi]
figure(1)
subplot(311);
plot(w2(1:length(w2)/2)/pi,10*log10(mag(1:length(w2)/2).^2));
title(sprintf('%d阶幅度响应系统幅频特性', p));
grid;
xlabel('以\pi为单位的频率');
ylabel('|幅度|');
axis([0 1 -50 50]);
ww = w/pi;
subplot(312);
pyulear(y,p,1024);%fft点数1024
axis([0 1 -50 50]);
subplot(313)
window=hamming(length(y));
nfft=512;%采样点数
[Pxx,w]=periodogram(y,window,nfft);%采用nfft点DFT变换。如果nfft大于信号长度，则x补零到长度nfft再做DFT。如果nfft小于信号长度，则对信号进行预包裹成nfft长度，再对包裹求和
plot(w/pi,10*log10(Pxx)),grid;axis([0 1 -50 50]);
xlabel('以\pi为单位的频率')
ylabel('功率谱密度')
title('周期图法估计psd')

N =1024;
n = 1:N-1;
% fi_1 = 2*pi*rand(size(n));
% fi_2 = 2*pi*rand(size(n));
fi_1 = 2*pi*rand();
fi_2 = 2*pi*rand();
noise_power = 1;
e = noise_power*randn(size(n));%返回一个n维的随机数组
y = 10*sin(0.24*pi*n+fi_1)+5*sin(0.26*pi*n+fi_2)+e;
p = 12;
[pxx,w] = pyulear(y,p);%p为AR模型阶次 
a = aryule(y,p);%求极点
%disp('A(z)的参数为');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %求系统频率响应[0,2*pi]
figure(2)
subplot(311);
plot(w2(1:length(w2)/2)/pi,10*log10(mag(1:length(w2)/2).^2));
title(sprintf('%d阶幅度响应系统幅频特性', p));
grid;
xlabel('以\pi为单位的频率');
ylabel('|幅度|');
axis([0 1 -50 50]);
ww = w/pi;
subplot(312);
pyulear(y,p,1024);axis([0 1 -50 50]);
%plot(ww,pxx);grid;title(sprintf('%d阶幅度响应', p));xlabel('以\pi为单位的频率');ylabel('|幅度|');axis([0 1 -50 50]);
subplot(313)
window=hamming(length(y));
nfft=512;%采样点数
[Pxx,w]=periodogram(y,window,nfft);
% plot(w/pi,(Pxx)),grid;
plot(w/pi,10*log10(Pxx)),grid;axis([0 1 -50 50]);
xlabel('以\pi为单位的频率')
ylabel('功率谱密度')
title('周期图法估计psd')

N =1024;
n = 1:N-1;
% fi_1 = 2*pi*rand(size(n));
% fi_2 = 2*pi*rand(size(n));
fi_1 = 2*pi*rand();
fi_2 = 2*pi*rand();
noise_power = 1;
e = noise_power*randn(size(n));%返回一个n维的随机数组
y = 10*sin(0.24*pi*n+fi_1)+5*sin(0.26*pi*n+fi_2)+e;
p = 64;
[pxx,w] = pyulear(y,p);%p为AR模型阶次 
a = aryule(y,p);%求极点
%disp('A(z)的参数为');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %求系统频率响应[0,2*pi]
figure(3)
p = 64;
[pxx,w] = pyulear(y,p);
a = aryule(y,p);
%disp('A(z)的参数为');disp(a);
[db,mag,pha,w2] = freqz_m(1,a); %求系统频率响应[0,2*pi]
subplot(311);plot(w2(1:length(w2)/2)/pi,10*log10(mag(1:length(w2)/2).^2));title(sprintf('%d阶幅度响应系统幅频特性', p));grid;xlabel('以\pi为单位的频率');ylabel('|幅度|');axis([0 1 -50 50]);
ww = w/pi;
subplot(312);
pyulear(y,p,1024);axis([0 1 -50 50]);
 %plot(ww,pxx);grid;title(sprintf('%d阶幅度响应', p));xlabel('以\pi为单位的频率');ylabel('|幅度|');
 subplot(313)
window=hamming(length(y));%hamming窗
nfft=1024;
[Pxx,w]=periodogram(y,window,nfft);
% plot(w/pi,(Pxx)),grid;
plot(w/pi,10*log10(Pxx)),grid;axis([0 1 -50 50]);
xlabel('以\pi为单位的频率')
ylabel('功率谱密度')
title('周期图法估计psd')