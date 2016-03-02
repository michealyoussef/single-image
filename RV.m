function [face ] = RV( path )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%obj=VideoReader(path);
VidObject = VideoReader(path);
while hasFrame(VidObject)
frame = readFrame(VidObject); 
[T, BB]=FaceDetectionVJ(frame);
  if T>0
      for i=1:T   
          M=BB(i,:);
        I2 = imcrop(frame,M);
              face=I2;

        figure,imshow(I2);
      end %end for loop
      break;
      end %end IF
end

end%end function

