function success_times = test_mon( SNR,eta )
%基本参数
success_times=0;
Fs=50;
n=Fs;
%传感器参数
snr1=SNR;
signal_num = 3;
sensor_num = 5;
S=10.*rand(1,3);
S1=[S;0,0,0;0,0,0];
ang(1)=pi/4;
ang(2)=pi/3;
ang(3)=-pi/6;%可增加或减少

% v1=exp(1i.*pi/2.*sin(i1));
% v2=exp(1i.*pi/2.*sin(i2));
% v3=exp(1i.*pi/2.*sin(i3));
% G=[v1,v2,v3];
% for i=1:1:5   %5个传感器，3个目标信号
%     for j2=1:1:3
%         A(i,j2)=G(j2)^(i-1);%  一列列写， 第二列平方项
%     end
% end %A阵列
A=zeros(n,signal_num);
for i=1:n
    for j=1:signal_num
        A(i,j)=exp(1i.*(i-1).*ang(j));
    end
end

%信号
% signalIn_sine=[awgn(sin(2*pi*t*300),snr1);awgn(sin(2*pi*t*300),snr1);awgn(sin(2*pi*t*300),snr1);];
signalIn_gauss=randn(signal_num,n);
%阵列传感器加噪
x=awgn(A*signalIn_gauss,snr1,'measured');
% x=awgn(A*S1,snr1,'measured');
Rxx=x*x'/Fs;
[~,D]=eig(Rxx);%求矩阵特征值，EV是以协方差矩阵的特征向量作为列向量的矩阵，D是以A的特征值作为对角值的对角矩阵
EVA=diag(D)';%取对角阵向量中的对角值
[EVA,~]=sort(EVA);%将对角值升序排序，I为下标
EVA=fliplr(EVA);%改为降序
[~,C]=size(EVA);
evA=sum(EVA);
for i=1:C
    EVA(i)=EVA(i)/evA;
end
for i=1:C
    if EVA(i)>eta
        success_times=success_times+1;
    end
end

end

