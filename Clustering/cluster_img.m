function img=cluster_img(ldx, K, height, width)
%将聚类算法得到结果转换为不同灰度的图象表示

img_d=zeros(height, width);
for i=1:length(ldx)
    for j=1:K
        if ldx(i)==j
            img_d(uint8(i/width)+1, mod(i, width)+1)=(j-1)*256/(K-1);
        end
    end
end
img=uint8(img_d);