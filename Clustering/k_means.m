function [ldx, C]=k_means(X, K)
%ʵ��kmeans�㷨

[row, col]=size(X);
ldx=zeros(row, 1);

C=zeros(K, col);
C_norm=zeros(K, col);
pre_C_norm=zeros(K, col);


[X_norm, PS]=mapminmax(X', 0, 1); %�����ݽ��й�һ��
X_norm=X_norm';
C_norm=rand(K, col);

loss=1; %�������
count=1; %��������
while loss>0.05 && count<=6
    %�����ݵ�鵽��������ľ�����������������
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
    %��ÿһ������ݵ����¼����������
    pre_C_norm=C_norm;
    point_sum=zeros(K, col);
    point_num=zeros(K, 1);
    for i=1:row
        point_sum(ldx(i), :)=point_sum(ldx(i), :)+X_norm(i, :);
        point_num(ldx(i))=point_num(ldx(i))+1;
    end
    C_norm=point_sum./repmat(point_num, 1, col);
    %���㱾�ε����������¾���������ԭ�������ĵľ���
    for i=1:K
        loss=loss+sqrt(sum((C_norm(i, :)-pre_C_norm(i, :)).^2));
    end
    loss=loss/K;
    count=count+1;
end
C=mapminmax('reverse', C_norm', PS);
C=C';