clc;
clear all;


 jpgFiles = dir('*.jpg');
  
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
a = imread(filename);
a1=im2b2(a);
a64=imresize(a1,[80 nan]);
%a40=imresize(a1,[40 nan]);
%a80=imresize(a1,[80 nan]);
    [C20,S20] = wavedec2(a64,1,'haar');
    [C40,S40] = wavedec2(a64,1,'haar');
    [C80,S80] = wavedec2(a64,1,'haar');
%[cA,cH,cV,cD] = dwt2(a,'haar');


A1= appcoef2(C64,S64,'haar',1);
%[x,y]=size(A);
vv1(1,:)=A1(:);
% [H,V,D] = detcoef2('all',C,S,1);
% H1(1,:)=H(:);
% V1(1,:)=V(:);
% D1(1,:)=D(:);
dlmwrite('H.txt',H1,'-append','newline', 'pc');
 dlmwrite('V.txt',V1,'-append','newline', 'pc');
 dlmwrite('D.txt',D1,'-append','newline', 'pc');
   
end
%   dlmwrite('xmoments.txt',x, ...
%         'newline', 'pc');
   
%       dlmwrite('cA.txt',cA,'newline', 'pc');
% 
% dlmwrite('cH.txt',cH,'newline', 'pc'); 
% dlmwrite('cV.txt',cV,'newline', 'pc'); 
% dlmwrite('cD.txt',cD,'newline', 'pc');
