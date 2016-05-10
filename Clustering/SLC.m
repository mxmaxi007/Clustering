function [K, ldx, C]=SLC(X, threshold)
%实现Sequential Leader Clustering算法

[row, col]=size(X);
ldx=zeros(row, 1);

[X_norm, PS]=mapminmax(X', 0, 1); %对输入数据进行归一化
X_norm=X_norm';

C=[];
C_norm=[];
C_sum=[];
C_point_num=[];
K=0;

for i=1:row
    %没有聚类中心时，将第一个点作为第一个聚类中心
    if K<=0 
        C_norm=X_norm(i, :);
        C_sum=C_norm;
        C_point_num=1;
        K=1;
        ldx(i)=1;
        continue;
    end
    %存在聚类中心时
    min_d=0;
    min_c=0;
    %找到当前点距离最近的聚类中心
    for j=1:K 
        d=sqrt(sum((X_norm(i, :)-C_norm(j, :)).^2));
        if min_d==0 || d<min_d
            min_d=d;
            min_c=j;
        end
    end
    if min_d<=threshold %与聚类中心的距离小于等于阈值则将该点归于该类
        ldx(i)=min_c;
        C_sum(min_c, :)=C_sum(min_c, :)+X_norm(i, :);
        C_point_num(min_c)=C_point_num(min_c)+1;
        C_norm(min_c, :)=C_sum(min_c, :)/C_point_num(min_c);
    else %与聚类中心的距离大于阈值则将该点作为新的聚类中心
        C_norm=[C_norm; X_norm(i, :)];
        C_sum=[C_sum; X_norm(i, :)];
        C_point_num=[C_point_num; 1];
        K=K+1;
        ldx(i)=K;
    end
end
C=mapminmax('reverse', C_norm', PS);%将聚类中心反归一化
C=C';

% draw_point(X, ldx, C, K);
% str=strcat('Threshold=', num2str(threshold), ' K=', num2str(K));
% title(str);