%信号数目判定
eta=[0.05 0.1 0.15 0.2];
SNR=-10:1:20;
L=200;
real_signal_num=3;
success_possibility=zeros(4,length(SNR));

for i=1:4
    for j=1:length(SNR)
        success_time=0;
        for k=1:200
            test_success_signal_num=test_mon(SNR(j),eta(i));
            if test_success_signal_num==real_signal_num
                success_time=success_time+1;
            end
        end
        success_possibility(i,j)=success_time/L;
    end
end
figure(1)
plot(SNR,success_possibility(1,:),'r');
hold on
plot(SNR,success_possibility(2,:),'g');
hold on
plot(SNR,success_possibility(3,:),'b');
hold on
plot(SNR,success_possibility(4,:),'m');
hold off
legend('0.05','0.1','0.15','0.2')
xlabel('SNR');ylabel('possibility');
