clc;
clear all;

 jpgFiles = dir('C:\Users\kalki\Documents\MATLAB\Mu\*.jpg')
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
I = imread(filename);
p=logical(not(I));

    [x1(1,i) y1(1,i) z1(1,i)]=Zernikmoment(p,4,2);
   
end
%   dlmwrite('xmoments.txt',x, ...
%         'newline', 'pc');
    dlmwrite('ymoments2.txt',y1,'newline', 'pc'); 
      dlmwrite('zmoments2.txt',z1,'newline', 'pc');
     