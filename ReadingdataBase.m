function [ imagedatebase,W ] = ReadingdataBase( path )
% path is path of dataset of image
%imagedatebase is array of image
% W is the number of image
if ~isdir(path)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

list=dir(path);  %get info of files/folders in current directory
isfile=~[list.isdir]; %determine index of files vs folders
filenames={list(isfile).name};
[~,W]=size(filenames);
for i=1:W
 imagedatebase{i} =  imread(char(strcat(path,'\',filenames(i))));
end

end

