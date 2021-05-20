function [label_test] =KNN(k,trainData,label_train,testData)
%k:测试值
%testData:测试数据，M*N矩阵
%trainData:训练数据，M*N矩阵
%label_train:训练样本所属类别的标号，1*N的矩阵
%label_test:测试样本对应k个最近邻训练样本的序号，行向量

dist=l2_distance(trainData,testData);
[~,nearest]=sort(dist);%排序
nearest=nearest(1:k,:);%取前k个，也就是最近的k个
label_test=label_train(nearest);%去索引到训练集

end

