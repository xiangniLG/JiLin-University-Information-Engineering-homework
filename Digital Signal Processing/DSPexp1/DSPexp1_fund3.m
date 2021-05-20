%离散卷积计算，这里是一个矩形序列卷一个指数序列
n=-5:50;
u1=stepseq(0,-5,50);
u2=stepseq(10,-5,50);
x=u1-u2;%创造一个序列长度是-5：50，但是仅在0：10为1的序列
h=((0.9).^n).*u1;%系统
subplot(3,1,1);
stem(n,x);
axis([-5,50,0,2]);
title('输入序列');
xlabel('n');
ylabel('x(n)');
subplot(3,1,2);
stem(n,h);
axis([-5,50,0,2]);
title('冲击响应序列');
xlabel('n');
ylabel('h(n)');
[y,ny]=conv_m(x,n,h,n);
subplot(3,1,3)
stem(ny,y);
axis([-5,50,0,8]);
title('输出响应');
xlabel('n');
ylabel('y(n)');

function [x,n]=stepseq(n0,n1,n2)%生成特定区间长度内的矩形序列
    n=n1:n2;
    x=[(n-n0)>=0];
end

function [y,ny]=conv_m(x,nx,h,nh)%计算线性卷积，其中y为卷积后序列，ny为卷积后序列范围（x轴）
    nyb=nx(1)+nh(1);
    nye=nx(length(x))+nh(length(h));
    ny=[nyb:nye];
    y=conv(x,h);
end

