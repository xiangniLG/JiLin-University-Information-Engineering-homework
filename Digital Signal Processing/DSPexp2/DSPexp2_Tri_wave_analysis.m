function DSPexp2_Tri_wave_analysis(count)
%���ڹ۲����ǲ��ͷ����ǲ���ʱ�򡢷�Ƶ����
N=8;%ȷ������
n=1:N;
xc=zeros(1,N);%���ǲ�����
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
title('���ǲ���ʱ����');
subplot(6,1,2),stem(n,xd);
title('�����ǲ���ʱ����');
%fft
XC=fft(xc,N);
XD=fft(xd,N);
AXC=abs(XC);
AXD=abs(XD);
angXC=angle(XC);
angXD=angle(XD);
subplot(6,1,3),plot(AXC);
title('���ǲ��ķ��Ȳ���');
subplot(6,1,4),plot(AXD);
title('�����ǲ��ķ��Ȳ���');
subplot(6,1,5),plot(angXC);
title('���ǲ���Ƶ�ʲ���');
subplot(6,1,6),plot(angXD);
title('�����ǲ���Ƶ�ʲ���');
end


