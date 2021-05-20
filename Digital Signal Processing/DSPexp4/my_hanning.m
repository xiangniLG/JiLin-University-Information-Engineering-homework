function [mag,db,pha,w,Rp,As]=my_hanning(wp,ws,tr_width,wc)
M=ceil(6.2*pi/tr_width)+1;
n=0:M-1;
alpha=(M-1)/2;
m=n-alpha+eps;%��ֹ��ĸΪ�㣬����С��
hd=sin(wc*m)./(pi*m);%������
w_han=(hanning(M))';%������
h=hd.*w_han;%�Ӵ�
[mag,db,pha,w]=freqz_m(h,[1]);
delta_w=2*pi/1000;
Rp=-(min(db(1:wp/delta_w+1)));%ͨ��˥��
As=-round(max(db(ws/delta_w+1:501)));%���˥��
end