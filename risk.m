function [R1_x,R2_x,result] = risk(x,pw1,pw2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
m=numel(x);
R1_x=zeros(1,m);
R2_x=zeros(1,m);
result=zeros(1,m);

e1=-2;a1=0.5;e2=2;a2=2;

r11=0;r12=2;r21=6;r22=0;

for i=1:m
    R1_x(i)=r21*pw2*normpdf(x(i),e2,a2)/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2));
    R2_x(i)=r12*pw1*normpdf(x(i),e1,a1)/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2));
end

for i=1:m
    if R2_x(i)>R1_x(i)
        result(i)=0;
    else
        result(i)=1;
    end
end

a=-5:0.05:5;
n=numel(a);
R1_plot=zeros(1,n);
R2_plot=zeros(1,n);

for j=1:n
    R1_plot(j)=r21*pw2*normpdf(a(j),e2,a2)/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
    R2_plot(j)=r12*pw1*normpdf(a(j),e1,a1)/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
end

figure(1);
hold on
plot(a,R1_plot,'b-',a,R2_plot,'g--');
for k=1:m
    if result(k)==0
        plot(x(k),R1_x(k),'b^');
    else
        plot(x(k),R2_x(k),'go')
    end
end

legend('Normal cells/正常细胞','Abnormal cells/异常细胞');
xlabel('Classified result/分类结果','fontsize',25);
ylabel('Occassional risk/条件风险','fontsize',25);
title('风险判决曲线','fontsize',25);
grid on
return