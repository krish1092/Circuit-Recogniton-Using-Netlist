clc;
im1=imread('C:\Users\kalki\Desktop\cropped.bmp');
im55 = im2bw(im1);
subplot(3,2,1);
imshow(im55);
%im1=rgb2gray(im1);
im1=mat2gray(im1);
subplot(3,2,2);
imshow(im1);
%figure;
mIM=medfilt2(im1,[15 15]);
subplot(3,2,3);
imshow(mIM);
%figure;
sIM=mIM-im1;
subplot(3,2,4);
imshow(sIM);
%figure;
bw=im2bw(sIM,0.05);
bwim2=imcomplement(bw);
bwim2=imcomplement(bwim2);
bwim2=medfilt2(bwim2);
bw = bwmorph(bwim2,'thin',3);
bwim2=imcomplement(bwim2);
subplot(3,2,5);
imshow(bwim2);
%figure;
%bw = bwmorph(bwim2,'thin',3);
bw=imcomplement(bw);
subplot(3,2,6);
imshow(bw);