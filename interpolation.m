function [ mIm ] = interpolation( Input_image,newwidth,newheigth)
%this function is for interpolation step
%Input_image is the variable for image of LOW resoluation
%mIm is output for image after interpolation done

mIm = imresize(Input_image, [newwidth newheigth]);
end

