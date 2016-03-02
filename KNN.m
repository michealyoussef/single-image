function [ KNNimageindex  ] = KNN(sample,imagedatabasePCA ,K,imageinput )
% imagedatabasePCA is Array for N images of database which will used for
% K is variable to find K nearest neig
% imageinput is the image which wanted to get for coresponding KNN
%KNNimage out of KNN for input image 
Group=[];
for f=1:imageinput
Group = [Group;f];
end
[KNNimageindex] = knnclassify2(sample,imagedatabasePCA,Group,K,'euclidean','nearest');
end
