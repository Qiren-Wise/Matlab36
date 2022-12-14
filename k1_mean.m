clc;clear all %命名时用下划线
x = [0 1 0 1 2 1 2 3 6 7 8 6 7 8 9 7 8 9 8 9;
    0 0 1 1 1 2 2 2 6 6 6 7 7 7 7 8 8 8 9 9 ]; 
figure(1)
plot(x(1,:),x(2,:),'r*');%横轴为第一行所有列，纵轴为第二行的所有列，红星表示

%第一步 选取聚类的中心，即令K= 2；
Z1 = [x(1,1);x(2,1)];   %横纵坐标
Z2 = [x(1,2);x(2,2)]; % 聚类中心为Z1（0，0） Z2（1，0）
% a = x(1,2);
R1 = [];
R2 = [];   %分成两个聚类，用于存储成员
t = 1;
K = 1; %记录迭代次数
dif1 = inf;
dif2 = inf;

%第二步 计算各点与聚类中心的距离
while (dif1>eps&dif2>eps)
    for i = 1:20
        dist1 = sqrt((x(1,i)-Z1(1)).^2 + (x(2,i)-Z1(2)).^2); %第一个点 第一行与下x（1,1） 第二行所有数与下（2，1）
        dist2 = sqrt((x(1,i)-Z2(1)).^2 + (x(2,i)-Z2(2)).^2); %第二点
        temp = [x(1,i),x(2,i)]'; %转置
        if dist1 < dist2
            R1 = [R1,temp];
        else
            R2 = [R2,temp];
        end
    end
    Z11 = mean(R1,2); %mean(A,2)包含每一行的平均值的列向量（对行求平均值）
    Z22 = mean(R2,2); %得到新的聚类中心
    t1 = Z1 - Z11; %判断两次是否相等，可用其它法
    t2 = Z2 - Z22;
    dif1 = sqrt(dot(t1,t1)); %dot 两个向量的点积
    dis2 = sqrt(dot(t2,t2));
    Z1 = Z11;
    Z2 = Z22;
    K = K+1;
    R1 = [];
    R2 = [];
end
hold on;
plot([Z1(1),Z2(1)],[Z1(2),Z2(2)],'g+');
