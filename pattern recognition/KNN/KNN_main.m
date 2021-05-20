clear all
clc

load x.m x
load y.m y
DATA=[x y];
label_train=[ones(1,100),zeros(1,100)];

data1=[-0.7303;2.1624];
data2=[1.4445;-0.1649];
data3=[-1.2587;0.9187];
data4=[1.2617;-0.2086];
data5=[0.7302;1.6587];
testdata=[data1 data2 data3 data4 data5];%生成测试集

i=0;
for k=1:2:100%取1—100的奇数作为k
    label_test=KNN(k,DATA,label_train,testdata);
    i=i+1;
    for j=1:5
        if(sum(label_test(:,j)==1)>sum(label_test(:,j)==0))%列向量放的是到这些训练集中元素的所属类别情况
            result(j,i)=1;%分类
        else
            result(j,i)=2;
        end
    end
end
%作图
plot(result(1,:),'r');
hold on
plot(result(2,:),'g');
hold on
plot(result(3,:),'b');
hold on
plot(result(4,:),'c');
hold on
plot(result(5,:),'m');
legend('一号样本随K值变化分类变化情况','二号样本随K值变化分类变化情况','三号样本随K值变化分类变化情况','四号样本随K值变化分类变化情况','五号样本随K值变化分类变化情况')
xlabel('k的第几次取值（1-100的奇数）','fontsize',25)
ylabel('分类结果','fontsize',25)
title('分类结果随k取值不同的变化曲线','fontsize',25)
axis([-3,55,0.75,2.25]);




