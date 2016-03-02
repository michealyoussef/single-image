function [ I2 ] = facedetection( Im )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
FDetect = vision.CascadeObjectDetector;
BB = step(FDetect,Im);
NumberOfFaces=size(BB,1);
bboxPoints = bbox2points(BB(1, :));

% bboxPoints = transformPointsForward(xform, bboxPoints);
minX = min(bboxPoints(:,1));
minY= min(bboxPoints(:,2));
width = max(bboxPoints(:,1))- min(bboxPoints(:,1));
heigth = max(bboxPoints(:,2))- min(bboxPoints(:,2));
I2 = imcrop(Im,[minX minY width heigth]);
I2=imresize(I2,[45,45]);

end

