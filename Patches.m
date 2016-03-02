function [ca] = Patches(image,patchsize)
rgbImage = (image);
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows, columns, numberOfColorBands] = size(rgbImage);
%==========================================================================
% The first way to divide an image up into blocks is by using mat2cell().
blockSizeR = patchsize; % Rows in block.
blockSizeC = patchsize; % Columns in block.
% Figure out the size of each block in rows.
% Most will be blockSizeR but there may be a remainder amount of less than that.
wholeBlockRows = floor(rows / blockSizeR);
blockVectorR = [blockSizeR * ones(1, wholeBlockRows), rem(rows, blockSizeR)];
% Figure out the size of each block in columns.
wholeBlockCols = floor(columns / blockSizeC);
blockVectorC = [blockSizeC * ones(1, wholeBlockCols), rem(columns, blockSizeC)];
% Create the cell array, ca.
% Each cell (except for the remainder cells at the end of the image)
% in the array contains a blockSizeR by blockSizeC by 3 color array.
% This line is where the image is actually divided up into blocks.
if numberOfColorBands > 1
    % It's a color image.
    ca = mat2cell(rgbImage, blockVectorR, blockVectorC, numberOfColorBands);
else
    ca = mat2cell(rgbImage, blockVectorR, blockVectorC);


end;

