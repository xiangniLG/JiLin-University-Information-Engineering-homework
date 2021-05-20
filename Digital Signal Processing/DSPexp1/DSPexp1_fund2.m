%离散系统的幅频，相频分析
b=[0.0181,0.0543,0.0543,0.0181];%分子系数
a=[1.000,-1.76,1.1829,-0.2781];%分母系数
m=0:length(b)-1;
n=0:length(a)-1;
K=500;
k=1:K;
w=pi*k/K;%归一，长度为pi
H=(b*exp(-1i*m'*w))./(a*exp(-1i*n'*w));%传递函数构建，'*是对应相乘，*是矩阵乘法
magH=abs(H);%求幅值
angH=angle(H);%求相位
figure(1)
subplot(2,1,1);
plot(w/pi,magH);
grid;
axis([0,1,0,1]);%x轴0—1，y轴0—1
xlabel('w(pi)');
ylabel('|H|');
title('幅度相应');
subplot(2,1,2);
plot(w/pi,angH);
grid;
xlabel('w(pi)')
ylabel('angle(H)');
title('相位响应')





