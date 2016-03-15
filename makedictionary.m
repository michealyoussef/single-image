function [ arrayofdictionary ] = makedictionary( KNNimagespatches,numberofpicture,numberperheight,numberperwidth,patchsize)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

arrayofdictionary=[];
for H=1:numberperheight-1
    for W=1:numberperwidth-1
        X=[];
        Y=[patchsize,patchsize,3];
        for i=1:numberofpicture
            ca=KNNimagespatches{i};
            Y=ca{H,W};
            P= reshape(Y,1,patchsize*patchsize*3);
            X=[X;P(1:floor(patchsize*patchsize/2)) P((floor(patchsize*patchsize/2)+1:patchsize*patchsize))];
        end
        arrayofdictionary{H,W}=X;
    end
    
end

