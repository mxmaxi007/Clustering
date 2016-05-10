function [ldx, C]=k_means(X, K)
%实现kmeans算法

[row, col]=size(X);
ldx=zeros(row, 1);

C=zeros(K, col);
C_norm=zeros(K, col);
pre_C_norm=zeros(K, col);


[X_norm, PS]=mapminmax(X', 0, 1); %对数据进行归一化
X_norm=X_norm';
C_norm=rand(K, col);

loss=1; %迭代误差
count=1; %迭代次数
while loss>0.05 && count<=6
    %将数据点归到距离最近的聚类中心所属的类中
    for i=1:row
        min_d=0;
        min_c=0;
        for j=1:K
            d=sqrt(sum((X_norm(i, :)-C_norm(j, :)).^2));
            if min_d==0 || d<min_d
                min_d=d;
                min_c=j;
            end
        end
        ldx(i)=min_c;
    end
    C=mapminmax('reverse', C_norm', PS);
    C=C';
    
%     draw_point(X, ldx, C, K);
%     str=strcat('iteration=', num2str(count));
%     title(str);
    %对每一类的数据点重新计算聚类中心
    pre_C_norm=C_norm;
    point_sum=zeros(K, col);
    point_num=zeros(K, 1);
    for i=1:row
        point_sum(ldx(i), :)=point_sum(ldx(i), :)+X_norm(i, :);
        point_num(ldx(i))=point_num(ldx(i))+1;
    end
    C_norm=point_sum./repmat(point_num, 1, col);
    %计算本次迭代产生的新聚类中心与原聚类中心的距离
    for i=1:K
        loss=loss+sqrt(sum((C_norm(i, :)-pre_C_norm(i, :)).^2));
    end
    loss=loss/K;
    count=count+1;
end
C=mapminmax('reverse', C_norm', PS);
C=C';