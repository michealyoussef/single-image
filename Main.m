function [ output_args ] = Main( path,inputlRimage,inputvideo,sizefactor,K,flag)
newwidth = 45;newheigth = 45;


if flag==1%%% when take image from video
    [,]=RV(inputvideo);
else %% when take face from image
    inputlRimage=imreadd(inputlRimage);
    inputlRimage= imresize(inputlRimage,[128 128]);
    % inputlRimage = imresize(inputlRimage, [31 31]);
    inputlRimage = facedetection(inputlRimage);
end;

[imagedatabase,numberofimage] = ReadingdataBase(path);
interpolatedimage = interpolation(inputlRimage,newwidth,newheigth);
arrayoffeature = PCA(imagedatabase,numberofimage);
X{1}=inputlRimage;
featureofinputimage = PCA(X,1);
index = KNN(featureofinputimage,arrayoffeature,K,numberofimage);
figure,imshow(X{1}),title('input image');
figure ,title('KNN image LR')
for i=1:K-1
    subplot(2, ceil(K/2), i),imshow(imagedatabase{index(i)});
end;
%%%%%%%%%%% patching KNN HR-images
for i=1:K-1
    pactchingimages{i}=Patches(imagedatabase{index(i+1)});
end;

end

