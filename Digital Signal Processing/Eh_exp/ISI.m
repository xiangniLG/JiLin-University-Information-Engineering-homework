c=0.4;
x1=c*rand();
x2=c*rand();
x3=c*rand();%�ŵ�����
isi=[1,x1,x2,x3];
snr=10;  %AWGN�ŵ������

% �����˲���������
order=63;  %�˲�������
len=1000;  %ѵ�����г���
u=0.02;  %��������
M=(order-1)/2;
N=len+length(isi)-1;
e=zeros(1,N);
error=e;
y=zeros(1,N); %FIR�˲������

% �ŵ��������
for i=1:100
    x=sign(rand(1,len)-0.5);%����PN����Ϊѵ������
    noise=randn(1,N)/10.^(snr/10);%AWGN
    y=conv(isi,x)+noise;%���
    wk=zeros(1,order);%�����˲���ϵ��
    for n=order:N-M+1 %LMS�㷨
        y1=y(n+M-1:-1:n-M-1);
        d1=wk*y1';
        e(n)=x(n)-d1;
        wk=wk+u*e(n)*y1;
        e(n)=10*log10(abs(e(n)));
    end
    error=error+e;
end

error=error(order:N-M+1)/100;%���ֵ
t=1:length(error);

plot(t,error);
title('�����������');
ylabel('���dB');
xlabel('n');

% ����ź�ͨ����������ŵ�
M = 4; 
msg = randi([0,M-1],1500,1); %����һ��1500 x 1 ��[0��M-1]�����ڵ������������
modmsg = qammod(msg,M); %����qam���Ƶ�ӳ��
trainlen = 500; %����ѵ�����е�֡��
chan = [.986; .845; .237; .123+.31i]; %�����ŵ�����
filtmsg = filter(chan,1,modmsg); % ģ���ŵ��仯
eq1 = lineareq(8,lms(0.01));%���ɾ���������
eq1.SigConst = qammod([0:M-1],M); % ��������ͼ
[symbolest,yd] = equalize(eq1,filtmsg,modmsg(1:trainlen)); 
h = scatterplot(filtmsg,1,trainlen,'bx'); hold on; %�����ǻ���δ����������ź�
scatterplot(symbolest,1,trainlen,'g.',h); %��ԭͼ�Ļ���������ɫ���������������ź�
scatterplot(eq1.SigConst,1,0,'k*',h); %��ԭͼ�Ļ������Ի�ɫ�����������ͼ
legend('δ�������ź�����ͼ','���������ͼ', '��������ͼ');
hold off;

% ����������
demodmsg_noeq = qamdemod(filtmsg,M); %���δ���������
demodmsg = qamdemod(yd,M); %����Ѿ��������
[nnoeq,rnoeq] = symerr(demodmsg_noeq(trainlen+1:end),msg(trainlen+1:end));%�Ա�δ�����źź������źŵ������������
[neq,req] = symerr(demodmsg(trainlen+1:end),msg(trainlen+1:end));%�ԱȾ����źź������źŵ������������
    

disp('����֮ǰ��������:')
disp(rnoeq)

disp('����֮���������:')
disp(req)
