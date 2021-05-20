%% --- What is this script ---
% This script uses an adaptive LMS filter to estimate the linear value of
% u(n)=-0.99u(n-1)+v(n)
%% --- Variable Preparation ---
N = 500;           %样本数量1000个

% 生成理想信号d(n)，d(n)初值为20
d = zeros(N,1); d(1)=20;
a1 = 0.99;
for n=2:N
    d(n)=a1*d(n-1);
end

% 生成白噪声v(n)
sigmaV2 = 0.995;    %白噪声方差
v = sqrt(sigmaV2)*rand(N,1);

% 生成带噪信号u(n)
u = d+v;

% %% --- LMS Algorithm ---
mu = 0.0005;            %LMS步长0.05
M = 3;                  %抽头数M=2
LMS=dsp.LMSFilter('Length',M,'StepSize',mu);
% d 参考理想信号
% u 输入带噪信号
% y 预测信号
% e 预测误差
[y,e,w] = LMS(d,u);
% 归一化的均方差
std_lms=std(e,1);
% 预测结果y与理想参考信号d的自相关
[corr_lms]=xcorr(d,y);
disp("LMS抽头权值为：");
disp(w);
figure; bar(std_lms);   title("LMS均方误差");
figure; plot(corr_lms);  title("预测y与参考信号d的互相关");
figure; hold on;
plot(y); plot(d); plot(e);
legend('预测值','参考值','预测误差');      %添加图例