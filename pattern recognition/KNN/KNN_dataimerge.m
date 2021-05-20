clear all
close all
mu1=2;sigma1=2;
mu2=-2;sigma2=4;
x = mu1 + sqrt(sigma1) * randn(2,100);
y = mu2 + sqrt(sigma2) * randn(2,100);
plot(x(1,:),x(2,:),'ro');
hold on
plot(y(1,:),y(2,:),' b*');
save x.m x -ascii  %生成类别一
save y.m y -ascii  %生成类别二
