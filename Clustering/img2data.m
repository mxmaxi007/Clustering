function data=img2data(img, height, width, dim)
%将图像矩阵转换为聚类算法处理的标准数据格式

img_d=im2double(img);
data=[];
for i=1:height
    for j=1:width
        temp=0;
        for k=1:dim
            temp=temp+img_d(i, j, k);
        end
        data=[data; temp/dim];
    end
end