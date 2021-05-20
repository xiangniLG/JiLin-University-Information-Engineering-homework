%不同窗函数下的FIR滤波器比较：0.3pi-0.5pi
wp=0.3*pi;
ws=0.5*pi;
tr_width=ws-wp;
wc=(wp+ws)/2;
[mag1,db1,pha1,w1,Rp1,As1]=my_blackman(wp,ws,tr_width,wc);
[mag2,db2,pha2,w2,Rp2,As2]=my_boxcar(wp,ws,tr_width,wc);
[mag3,db3,pha3,w3,Rp3,As3]=my_hamming(wp,ws,tr_width,wc);
[mag4,db4,pha4,w4,Rp4,As4]=my_hanning(wp,ws,tr_width,wc);
[mag5,db5,pha5,w5,Rp5,As5]=my_triang(wp,ws,tr_width,wc);
figure(1)
plot(w1/pi,db1,w2/pi,db2,w3/pi,db3,w4/pi,db4,w5/pi,db5)
legend('布莱克曼窗','矩形窗','哈明窗','汉宁窗','三角窗')
axis([0,1,-100,10]);
grid on;
ylabel('H(db)');
set(gca,'XTickmode','manual','XTick',[0,0.3,0.5,1]);
set(gca,'YTickmode','manual','YTick',[-20,-3,0]);
