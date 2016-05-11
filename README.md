# DM-Homework 3
## Clustering Techniques and Applications

*姓名：马习*   
*学号：2015210954*   
*日期：2016/5/10*


### 实验1 聚类算法在二维数据集上的演示
#### 一、实验目的

1. 实现kmeans算法和Sequential Leader Clustering算法
2. 展示数据模式对结果的影响
3. 展示算法参数对结果的影响

#### 二、实验方法
##### kmeans算法

1. 从n个数据对象中任意选择k个对象作为初始聚类中心
2. 计算每个对象与这些中心对象的距离，并根据最小距离重新对相应对象进行划分
3. 重新计算每个簇中所有对象的均值作为聚类中心
4. 循环2和3直到聚类中心的变化小于设定的阈值

##### Sequential Leader Clustering算法

1. 将第一个数据对象作为一个新的聚类中心
2. 计算新对象与所有聚类中心的距离
3. 新对象与最近的聚类中心的距离如果小于设定的阈值，则将新对象加入该类；否则，将新对象作为一个新的聚类中心
4. 当所有的对象都处理完后结束

##### 二维数据聚类演示

1. 设定3个二维高斯分布的均值和协方差矩阵，然后每个高斯分布生成100个二维随机点
2. 设定kmeans算法的K为3，然后对生成的随机点进行聚类演示
3. 设定Sequential Leader Clustering算法的阈值，然后对生成的随机点进行聚类演示

#### 三、实验结果及分析
##### kmeans算法聚类结果分析
###### 1. kmeans算法的执行过程展示如下

*二维数据点的实际分布图*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_1.jpg)

*kmeans聚类过程*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_it1_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_it2_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_it3_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_it4_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_it5_1.jpg)

在这一数据集下可以看出，经过5轮迭代，kmeans算法得到的数据点分布已经基本与数据点的实际分布相同。

###### 2. kmeans算法在不同数据模式下的聚类效果

*数据点分布较为紧凑，第一张图为实际分布，第二张图为聚类结果,下同*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_it5_1.jpg)

*数据点分布较为分散*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_2.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_shape_2.jpg)

可以看出在数据点分布较为紧凑时，kmeans算法聚类效果较好，但当数据点分布较为分散且不同类之间的数据点重叠在一起的过多时，kmeans算法的聚类效果不好。

####### 3. kmeans在选取不同初始聚类中心时的聚类效果

*二维数据点的实际分布图*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_2.jpg)

*不同初始聚类中心的聚类效果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_shape_2.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/km_para_2.jpg)

可以看出当选取不同的初始聚类中心时，对最后的聚类结果差生了影响。

##### Sequential Leader Clustering算法聚类结果分析
###### 1. Sequential Leader Clustering算法的执行过程展示如下

*二维数据点的实际分布图*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_1.jpg)

*Sequential Leader Clustering算法的聚类效果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_th5_1.jpg)

Sequential Leader Clustering算法不需要设定类的数目，会根据设定的阈值进行聚类，并且只需要扫描一遍数据就可结束。

###### 2. Sequential Leader Clustering算法在不同数据模式下的聚类效果

*数据点分布较为紧凑，第一张图为实际分布，第二张图为聚类结果,下同*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_th5_1.jpg)

*数据点分布较为分散*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_2.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_shape_2.jpg)

对于分布紧凑的数据点的聚类效果不如kmeans算法的效果好，但对于分布分散的数据点的聚类效果比kmeans算法要好。


###### 3. Sequential Leader Clustering算法在不同阈值下的聚类效果

*二维数据点的实际分布图*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_1.jpg)

*Sequential Leader Clustering算法在不同阈值下的聚类效果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_th3_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_th4_1.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_th5_1.jpg)

可以看出当阈值设定的不同，会影响最后聚类的数目和聚类的结果。


###### 4. Sequential Leader Clustering算法在数据点进入顺序不同时的聚类效果

*二维数据点的实际分布图*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/source_2.jpg)

*Sequential Leader Clustering算法在数据点进入顺序不同时的聚类效果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_shape_2.jpg)
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/slc_para_2.jpg)

可以看出当算法执行时，数据点进入的顺序对于最后的聚类结果影响很大。

### 实验2 使用聚类算法进行图像分割
#### 一、实验目的

1. 使用kmeans算法和Sequential Leader Clustering算法对灰度图进行分割。
2. 使用kmeans算法和Sequential Leader Clustering算法对彩色图进行分割。

#### 二、实验方法

1. 对于灰度图，将每个像素点的灰度值作为聚类时数据点的值，然后使用两种算法分别对该数据集进行聚类。
2. 对于彩色图，将HSI空间中的I分量作为聚类时数据点的值，然后使用两种算法分别对该数据集进行聚类。
3. 对于每一类的像素点使用特定的灰度值表示，然后将聚类结果通过图像显示出来。

#### 三、实验结果及分析
##### 灰度图像的聚类结果

*原始灰度图*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/lena_gray.jpg)

*kmeans算法聚类结果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/lena_gray_km.jpg)

*Sequential Leader Clustering算法聚类结果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/lena_gray_slc.jpg)

两张图像都被分割为三类，可以看出kmeans算法的聚类结果优于Sequential Leader Clustering算法聚类结果。

##### 彩色图像的聚类结果
*原始彩色图*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/lena.png)

*kmeans算法聚类结果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/lena_km.jpg)

*Sequential Leader Clustering算法聚类结果*   
![](https://github.com/mxmaxi007/Clustering/raw/master/Clustering/lena_slc.jpg)

彩色图像的分割仅采用HSI空间中的I分量，对于H分量和S分量也可以采用，但H分量是使用弧度定义的，因此在度量距离时应该采用余弦距离而不是欧拉距离，当然三个分量也可以同时使用。同样，kmeans算法的聚类效果优于Sequential Leader Clustering算法。