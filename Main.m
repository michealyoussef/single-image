function [ output_args ] = Main( path,inputlRimage,inputvideo,patchsize,sizefactor,K,flag)
newwidth = 45;newheigth = 45;


if flag==1%%% when take image from video
    [inputlRimage]=RV(inputvideo);
else %% when take face from image
    inputlRimage=imreadd(inputlRimage);
end;
inputlRimage= imresize(inputlRimage,[128 128]);
% inputlRimage = imresize(inputlRimage, [31 31]);
% inputlRimage = facedetection(inputlRimage);

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
close all;

for i=1:K-1
    figure,imshow(imagedatabase{index(i+1)});
    [rows columns numberOfColorBands] = size(imagedatabase{index(i+1)});
    blockSizeR = patchsize; % Rows in block.
    blockSizeC = patchsize; % Columns in block.
    % Figure out the size of each block in rows.
    % Most will be blockSizeR but there may be a remainder amount of less than that.
    wholeBlockRows = floor(rows / blockSizeR);
    blockVectorR = [blockSizeR * ones(1, wholeBlockRows), rem(rows, blockSizeR)];
    % Figure out the size of each block in columns.
    wholeBlockCols = floor(columns / blockSizeC);
    blockVectorC = [blockSizeC * ones(1, wholeBlockCols), rem(columns, blockSizeC)];
    pactchingimages{i}=Patches(imagedatabase{index(i+1)},patchsize);
    CA=pactchingimages{i};
    numPlotsR = size(CA, 1);
    numPlotsC = size(CA, 2);
    plotIndex=1;
    figure;
    for x=1:0
        %numPlotsR
        for y=1:0
            %numPlotsC
            %      fprintf('plotindex = %d,   c=%d, r=%d\n', plotIndex, c, r);
            % Specify the location for display of the image.
            subplot(numPlotsR, numPlotsC, plotIndex);
            % Extract the numerical array out of the cell
            % just for tutorial purposes.
            rgbBlock = CA{x,y};
            imshow(rgbBlock); % Could call imshow(ca{r,c}) if you wanted to.
            [rowsB columnsB ~] = size(rgbBlock);
            % Make the caption the block number.
            % 		caption = sprintf('Block #%d of %d\n%d rows by %d columns', ...
            % 			plotIndex, numPlotsR*numPlotsC, rowsB, columnsB);
            % 		title(caption);
            drawnow;
            % Increment the subplot to the next location.
            plotIndex = plotIndex + 1;
        end;
    end;
end;

outdict=makedictionary(pactchingimages,K-1,numPlotsR,numPlotsC,patchsize);
H=0;
end

