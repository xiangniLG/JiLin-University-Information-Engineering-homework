%FIR�˲�����ƣ�0.2pi-0.35pi��1dB-15dB
wp=0.2*pi;
ws=0.35*pi;
tr_width=ws-wp;
wc=(wp+ws)/2;
M=ceil(6.6*pi/tr_width)+1;%��������ȷ���ɴ���Ҫ��B=6.6PI/N
n=0:M-1;
alpha=(M-1)/2;
m=n-alpha+eps;%��ֹ��ĸΪ�㣬����С��
hd=sin(wc*m)./(pi*m);%������
w_ham=(hamming(M))';%������
h=hd.*w_ham;%�Ӵ�
[mag,db,pha,w]=freqz_m(h,[1]);
delta_w=2*pi/1000;
Rp=-(min(db(1:wp/delta_w+1)));%ͨ��˥��
As=-round(max(db(ws/delta_w+1:501)));%���˥��
figure(1);
subplot(2,2,1);
stem(n,hd);
title('��������Ӧ');
axis([0,M-1,-0.1,0.3]);
ylabel('hd(n)');
subplot(2,2,2);
stem(n,h);
title('ʵ�ʳ弤��Ӧ');
axis([0,M-1,-0.1,0.3]);
ylabel('hd(n)');
subplot(2,2,3);
plot(w/pi,pha);
title('�˲�����λ��Ӧ');
axis([0,1,-pi,pi]);
ylabel('pha');
set(gca,'XTickmode','manual','XTick',[0,0.2,0.3,1.1]);
set(gca,'YTickmode','manual','YTick',[-pi,0,pi]);
grid;
subplot(2,2,4);
plot(w/pi,db);
title('�˲���������Ӧ')
axis([0,1,-100,10]);
ylabel('H(db)');
set(gca,'XTickmode','manual','XTick',[0,0.2,0.3,1.1]);
set(gca,'YTickmode','manual','YTick',[-50,-15,0]);
%���Ҳ�ͨ���˲���
Fs=1000;
t=0:1/Fs:1;
len=512;
f=Fs*(0:len/2-1)/len;
s10=sin(20*pi*t);%10Hz����
s100=sin(200*pi*t);%100Hz
s150=sin(300*pi*t);%150Hz
s250=sin(500*pi*t);%250Hz
s=s10+s100+s150+s250;
s_f=conv(s,h);%�����ź���ϵͳ��ʱ�򣩾���������ͨ���˲���
s_jw=fft(s_f,len);%���˲����źŽ���fft
figure(2);
subplot(2,1,1);plot(s_f,'red');grid;  
legend('�˲����˲���');  
subplot(2,1,2);plot(f,abs(s_jw(1:len/2)));grid;  
title('�˲����ź�Ƶ��');  
xlabel('Hz');ylabel('��ֵ');  

