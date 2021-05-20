function [result] = bayes( x,pw1,pw2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
m=numel(x);
pw1_x=zeros(1,m);
pw2_x=zeros(1,m);
result=zeros(1,m);
e1=-2;a1=0.5;
e2=2;a2=2;

for i=1:m
    pw1_x(i)=(pw1*normpdf(x(i),e1,a1))/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2));
    pw2_x(i)=(pw2*normpdf(x(i),e2,a2))/(pw1*normpdf(x(i),e1,a1)+pw2*normpdf(x(i),e2,a2));
end

for i=1:m
    if pw1_x(i)>pw2_x(i)
        result(i)=0;
    else
        result(i)=1;
    end
end

a=-5:0.05:5;
n=numel(a);
pw1_plot=zeros(1,n);
pw2_plot=zeros(1,n);

for j=1:n
    pw1_plot(j)=(pw1*normpdf(a(j),e1,a1))/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
    pw2_plot(j)=(pw2*normpdf(a(j),e2,a2))/(pw1*normpdf(a(j),e1,a1)+pw2*normpdf(a(j),e2,a2));
end

figure(1)
hold on
plot(a,pw1_plot,'k-',a,pw2_plot,'r-.');

for k=1:m
    if result(k)==0
        plot(x(k),pw1_x(k),'b*');
    else
        plot(x(k),pw2_x(k),'rp')
    end
end

legend('Normal cells posterior probablity density curve/正常细胞后验概率曲线','Abnormal cells posterior probability density curve/异常细胞后验概率曲线','Normal cells/正常细胞','Abnormal cells/异常细胞');
xlabel('Observation of sample cells/样本细胞观察值','fontsize',25);
ylabel('Posterior probablity/后验概率','fontsize',25)
title('Posterior probablity curve/后验概率分布曲线','fontsize',25)
grid on
return
