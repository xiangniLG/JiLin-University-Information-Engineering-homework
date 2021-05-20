%��ɢ������㣬������һ���������о�һ��ָ������
n=-5:50;
u1=stepseq(0,-5,50);
u2=stepseq(10,-5,50);
x=u1-u2;%����һ�����г�����-5��50�����ǽ���0��10Ϊ1������
h=((0.9).^n).*u1;%ϵͳ
subplot(3,1,1);
stem(n,x);
axis([-5,50,0,2]);
title('��������');
xlabel('n');
ylabel('x(n)');
subplot(3,1,2);
stem(n,h);
axis([-5,50,0,2]);
title('�����Ӧ����');
xlabel('n');
ylabel('h(n)');
[y,ny]=conv_m(x,n,h,n);
subplot(3,1,3)
stem(ny,y);
axis([-5,50,0,8]);
title('�����Ӧ');
xlabel('n');
ylabel('y(n)');

function [x,n]=stepseq(n0,n1,n2)%�����ض����䳤���ڵľ�������
    n=n1:n2;
    x=[(n-n0)>=0];
end

function [y,ny]=conv_m(x,nx,h,nh)%�������Ծ��������yΪ��������У�nyΪ��������з�Χ��x�ᣩ
    nyb=nx(1)+nh(1);
    nye=nx(length(x))+nh(length(h));
    ny=[nyb:nye];
    y=conv(x,h);
end

