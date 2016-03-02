%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part of Volterrafaces demo. This function is used for spliting the images
% into overlapping or non-overlapping patches.
% Input:
%   im = rows x cols x subjects x indexed images of each subject
%   mm = number of patches along rows and cols with non-overlapping patches
%   overlap = 1, overlapping patches, = 0, non-overlapping patches
% Output:
%   imt = stack of patches
%   m,n = size of the patches
%
% e.g. for 32x32x38x64 input stack for Yale B with mm = 4 and overlap = 0,
% you get 16 8x8 patches. Same input stack with mm = 4 and overlap = 1,
% gives 36 12x12 patches.
%
% Copyright (c) Ritwik Kumar, Harvard University 2010
%               www.seas.harvard.edu/~rkkumar
% 
% Please cite the following paper if you find this code useful:
% Ritwik Kumar, Arunava Banerjee & Baba C. Vemuri, Volterrafaces: 
% Discriminant Analysis using Volterra Kernels, IEEE Conference on 
% Computer Vision and Pattern Recognition (CVPR) 2009.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [imt m n] = splitImg(im,mm,overlap)

% the code is fairly straightforward but involves some logic for splitting
% the images into patches.

imgSize1 = size(im,1);
imgSize2 = size(im,2);

if(length(mm)==1)
    mm(2) = mm(1);
end

m = imgSize1/mm(1);
n = imgSize2/mm(2);

if(overlap == 0) %non-overlapping patches
    for i=1:mm(1)
        for j=1:mm(2)
            imt(:,:,:,:,(i-1)*mm(2)+j) = im((i-1)*m+1:i*m,(j-1)*n+1:j*n,:,:);
        end
    end
else %overlapping patches
    mm = (2*mm) -2;
    for i=1:mm(1)
        for j=1:mm(2)
            imt(:,:,:,:,(i-1)*mm(2)+j) = im((i-1)*ceil(m/2)+1:(i/2+1)*m,(j-1)*ceil(n/2)+1:(j/2+1)*n,:,:);
        end
    end

    m = 3/2 * m;
    n = 3/2 * n;
end
