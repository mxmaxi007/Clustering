function [K, ldx, C]=SLC(X, threshold)
%ʵ��Sequential Leader Clustering�㷨

[row, col]=size(X);
ldx=zeros(row, 1);

[X_norm, PS]=mapminmax(X', 0, 1); %���������ݽ��й�һ��
X_norm=X_norm';

C=[];
C_norm=[];
C_sum=[];
C_point_num=[];
K=0;

for i=1:row
    %û�о�������ʱ������һ������Ϊ��һ����������
    if K<=0 
        C_norm=X_norm(i, :);
        C_sum=C_norm;
        C_point_num=1;
        K=1;
        ldx(i)=1;
        continue;
    end
    %���ھ�������ʱ
    min_d=0;
    min_c=0;
    %�ҵ���ǰ���������ľ�������
    for j=1:K 
        d=sqrt(sum((X_norm(i, :)-C_norm(j, :)).^2));
        if min_d==0 || d<min_d
            min_d=d;
            min_c=j;
        end
    end
    if min_d<=threshold %��������ĵľ���С�ڵ�����ֵ�򽫸õ���ڸ���
        ldx(i)=min_c;
        C_sum(min_c, :)=C_sum(min_c, :)+X_norm(i, :);
        C_point_num(min_c)=C_point_num(min_c)+1;
        C_norm(min_c, :)=C_sum(min_c, :)/C_point_num(min_c);
    else %��������ĵľ��������ֵ�򽫸õ���Ϊ�µľ�������
        C_norm=[C_norm; X_norm(i, :)];
        C_sum=[C_sum; X_norm(i, :)];
        C_point_num=[C_point_num; 1];
        K=K+1;
        ldx(i)=K;
    end
end
C=mapminmax('reverse', C_norm', PS);%���������ķ���һ��
C=C';

% draw_point(X, ldx, C, K);
% str=strcat('Threshold=', num2str(threshold), ' K=', num2str(K));
% title(str);