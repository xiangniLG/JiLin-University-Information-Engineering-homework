c=0.4;
x1=c*rand();
x2=c*rand();
x3=c*rand();%信道参数
isi=[1,x1,x2,x3];
snr=10;  %AWGN信道信噪比

% 定义滤波器各参数
order=63;  %滤波器阶数
len=1000;  %训练序列长度
u=0.02;  %调整步长
M=(order-1)/2;
N=len+length(isi)-1;
e=zeros(1,N);
error=e;
y=zeros(1,N); %FIR滤波器输出

% 信道均衡过程
for i=1:100
    x=sign(rand(1,len)-0.5);%采用PN码作为训练序列
    noise=randn(1,N)/10.^(snr/10);%AWGN
    y=conv(isi,x)+noise;%输出
    wk=zeros(1,order);%横向滤波器系数
    for n=order:N-M+1 %LMS算法
        y1=y(n+M-1:-1:n-M-1);
        d1=wk*y1';
        e(n)=x(n)-d1;
        wk=wk+u*e(n)*y1;
        e(n)=10*log10(abs(e(n)));
    end
    error=error+e;
end

error=error(order:N-M+1)/100;%误差值
t=1:length(error);

plot(t,error);
title('误差收敛曲线');
ylabel('误差dB');
xlabel('n');

% 随机信号通过理想均衡信道
M = 4; 
msg = randi([0,M-1],1500,1); %产生一个1500 x 1 在[0，M-1]区域内的随机整数序列
modmsg = qammod(msg,M); %进行qam调制的映射
trainlen = 500; %定义训练序列的帧长
chan = [.986; .845; .237; .123+.31i]; %定义信道参量
filtmsg = filter(chan,1,modmsg); % 模拟信道变化
eq1 = lineareq(8,lms(0.01));%生成均衡器对象
eq1.SigConst = qammod([0:M-1],M); % 设置星座图
[symbolest,yd] = equalize(eq1,filtmsg,modmsg(1:trainlen)); 
h = scatterplot(filtmsg,1,trainlen,'bx'); hold on; %以蓝星画出未经过均衡的信号
scatterplot(symbolest,1,trainlen,'g.',h); %在原图的基础上以绿色画出经过均衡后的信号
scatterplot(eq1.SigConst,1,0,'k*',h); %在原图的基础上以黄色标出理想星座图
legend('未经均衡信号星座图','均衡后星座图', '理想星座图');
hold off;

% 计算误码率
demodmsg_noeq = qamdemod(filtmsg,M); %解调未均衡的码字
demodmsg = qamdemod(yd,M); %解调已均衡的码字
[nnoeq,rnoeq] = symerr(demodmsg_noeq(trainlen+1:end),msg(trainlen+1:end));%对比未均衡信号和样本信号的误码和误码率
[neq,req] = symerr(demodmsg(trainlen+1:end),msg(trainlen+1:end));%对比均衡信号和样本信号的误码和误码率
    

disp('均衡之前的误码率:')
disp(rnoeq)

disp('均衡之后的误码率:')
disp(req)
