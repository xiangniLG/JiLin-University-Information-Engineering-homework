function DSPexp2_Tri_wave_analysis(count)
%用于观察三角波和反三角波的时域、幅频特性
N=8;%确立点数
n=1:N;
xc=zeros(1,N);%三角波生成
xd=zeros(1,N);
for i=1:4
    xc(i)=i;
    xd(i)=5-i;
end

for j=5:8
    xc(j)=9-j;
    xd(j)=j-4;
end
figure(count);
subplot(6,1,1),stem(n,xc);
title('三角波的时域波形');
subplot(6,1,2),stem(n,xd);
title('反三角波的时域波形');
%fft
XC=fft(xc,N);
XD=fft(xd,N);
AXC=abs(XC);
AXD=abs(XD);
angXC=angle(XC);
angXD=angle(XD);
subplot(6,1,3),plot(AXC);
title('三角波的幅度波形');
subplot(6,1,4),plot(AXD);
title('反三角波的幅度波形');
subplot(6,1,5),plot(angXC);
title('三角波的频率波形');
subplot(6,1,6),plot(angXD);
title('反三角波的频率波形');
end


