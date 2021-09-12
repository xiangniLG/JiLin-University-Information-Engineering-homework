function success_times = test_mon( SNR,eta )
%��������
success_times=0;
Fs=50;
n=Fs;
%����������
snr1=SNR;
signal_num = 3;
sensor_num = 5;
S=10.*rand(1,3);
S1=[S;0,0,0;0,0,0];
ang(1)=pi/4;
ang(2)=pi/3;
ang(3)=-pi/6;%�����ӻ����

% v1=exp(1i.*pi/2.*sin(i1));
% v2=exp(1i.*pi/2.*sin(i2));
% v3=exp(1i.*pi/2.*sin(i3));
% G=[v1,v2,v3];
% for i=1:1:5   %5����������3��Ŀ���ź�
%     for j2=1:1:3
%         A(i,j2)=G(j2)^(i-1);%  һ����д�� �ڶ���ƽ����
%     end
% end %A����
A=zeros(n,signal_num);
for i=1:n
    for j=1:signal_num
        A(i,j)=exp(1i.*(i-1).*ang(j));
    end
end

%�ź�
% signalIn_sine=[awgn(sin(2*pi*t*300),snr1);awgn(sin(2*pi*t*300),snr1);awgn(sin(2*pi*t*300),snr1);];
signalIn_gauss=randn(signal_num,n);
%���д���������
x=awgn(A*signalIn_gauss,snr1,'measured');
% x=awgn(A*S1,snr1,'measured');
Rxx=x*x'/Fs;
[~,D]=eig(Rxx);%���������ֵ��EV����Э������������������Ϊ�������ľ���D����A������ֵ��Ϊ�Խ�ֵ�ĶԽǾ���
EVA=diag(D)';%ȡ�Խ��������еĶԽ�ֵ
[EVA,~]=sort(EVA);%���Խ�ֵ��������IΪ�±�
EVA=fliplr(EVA);%��Ϊ����
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

