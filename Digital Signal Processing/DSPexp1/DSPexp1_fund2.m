%��ɢϵͳ�ķ�Ƶ����Ƶ����
b=[0.0181,0.0543,0.0543,0.0181];%����ϵ��
a=[1.000,-1.76,1.1829,-0.2781];%��ĸϵ��
m=0:length(b)-1;
n=0:length(a)-1;
K=500;
k=1:K;
w=pi*k/K;%��һ������Ϊpi
H=(b*exp(-1i*m'*w))./(a*exp(-1i*n'*w));%���ݺ���������'*�Ƕ�Ӧ��ˣ�*�Ǿ���˷�
magH=abs(H);%���ֵ
angH=angle(H);%����λ
figure(1)
subplot(2,1,1);
plot(w/pi,magH);
grid;
axis([0,1,0,1]);%x��0��1��y��0��1
xlabel('w(pi)');
ylabel('|H|');
title('������Ӧ');
subplot(2,1,2);
plot(w/pi,angH);
grid;
xlabel('w(pi)')
ylabel('angle(H)');
title('��λ��Ӧ')





