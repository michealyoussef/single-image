function [ arrayofdictionary ] = makedictionary( KNNimagespatches,numberofpicture,numberperheight,numberperwidth)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

arrayofdictionary=[];
for H=1:numberperheight
    for W=1:numberperwidth
        X=[];
        for i=1:numberofpicture
            ca=KNNimagespatches{i};
            P= reshape(ca{H,W},patchsize*patchsize,1);
            X=[X;P(1:floor(patchsize*patchsize/2)) P((floor(patchsize*patchsize/2)+1:patchsize*patchsize))];
        end
      arrayofdictionary{H,W}=X;  
    end
    
end

