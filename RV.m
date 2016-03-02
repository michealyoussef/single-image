function [Num , array_of_structures] = RV( path )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%obj=VideoReader(path);
VidObject = VideoReader(path);
%Get the Video Resolution
VidHeight = VidObject.Height;
VidWidth = VidObject.Width;
while hasFrame(VidObject)
frame = readFrame(VidObject); 
[T, BB]=FaceDetectionVJ(frame);
   if T > 0
       Index=1;
        while Index<=T
       Out =  Facetracking(VidObject,BB(Index,:),frame);
       array_of_structures(Index).out = Out;
         %%%here we need to add vector.
       Index =Index+1;  
       %Face Hallucination for out Facs sequence 
      
       end
       break;
   end 

  k = k+1;
end

end%end function

