function [ table_of_features ] = PCA( ImagedataBase,numberofimage )
% ImagedataBase is arrayof image which wanted to represent it into features
% numberofimage is number of image
% PCAofimage is arrya of array of image features
table_of_features = [];
width = size(ImagedataBase{1},1);
height = size(ImagedataBase{1},2);
rshp_lowres = reshape(ImagedataBase{1}, width*height, 3);
coeff = pca(double(rshp_lowres));

for i=1:numberofimage
    training_image = ImagedataBase{i};
    training_image = double(training_image);
    training_width = size(training_image, 1);
    training_height = size(training_image, 2);
    reshaped_training_image = reshape(training_image, width * height, 3);    
    reduced_image = reshaped_training_image * coeff;
    x=transpose(reduced_image);    
    Y = reshape(x,1,width * height*3);
    table_of_features = [table_of_features; Y];
end

