clc;
clear;
srcFiles = dir('E:\Internship work\Original data\openwrist\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles)  
filename = strcat('E:\Internship work\Original data\openwrist\',srcFiles(i).name);
im = imread(filename);
k=imresize(im,[331,331]);
newfilename=strcat("E:\Internship work\Resize\331\openwrist\",srcFiles(i).name);
imwrite(k,newfilename,'jpg');
end

