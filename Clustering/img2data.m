function data=img2data(img, height, width, dim)
%��ͼ�����ת��Ϊ�����㷨����ı�׼���ݸ�ʽ

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