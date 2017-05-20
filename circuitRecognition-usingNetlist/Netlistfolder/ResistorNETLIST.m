clc;
clear all;
R=0;C=0;H=0;v=0;
i7=imread('character1.jpg');
h9=im2bw(i7);
h9=bwmorph(h9,'clean');
CC = bwconncomp(h9,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats=regionprops(CC,'area');
idx = find([stats.Area] >5);
stats=regionprops(CC,'BoundingBox');
for i=1:1:length(idx)
    x=stats(idx(i)).BoundingBox(1,1);
    y=stats(idx(i)).BoundingBox(1,2);
    width=stats(idx(i)).BoundingBox(1,3);
    height=stats(idx(i)).BoundingBox(1,4);
     a=imcrop(h9,[x y width height]);
    a=imresize(a,[20 20],'bilinear');
     a = padarray(a,[4,4], 0, 'both');

      ce(:,:,i) =a;
    imwrite(ce(:,:,i),sprintf('%d.jpg',i));

end

train2=csvread('HOFVtrain.txt');
  fid2=fopen('trainlabelHOFV.txt','r');
  s1=fread(fid2);
  s1((s1==44))=[];
  s1((s1==10))=[];
  s1((s1==13))=[];
 Rtrain069=csvread('Resistor\train 0 6 9\coodbinary.txt');
 Rlabel069ID=fopen('Resistor\train 0 6 9\numbers 0 6 9 K M.txt','r');
 Rlabel069=fread(Rlabel069ID);
 Rlabel069((Rlabel069==13))=[];
 Rlabel069((Rlabel069==10))=[];
 fclose(Rlabel069ID);
 Rtrain123457=csvread('Resistor\TRAIN 1 2 3 4 5 7\coodbinary.txt');
 Rlabel123457ID=fopen('Resistor\TRAIN 1 2 3 4 5 7\numbers 1 2 3 4 5 7 K M.txt','r');
 Rlabel123457=fread(Rlabel123457ID);
 Rlabel123457((Rlabel123457==13))=[];
 Rlabel123457((Rlabel123457==10))=[];
 fclose(Rlabel123457ID);
 Rtrain8=csvread('Resistor\TRAIN 8\coodbinary.txt');
 Rlabel8ID=fopen('Resistor\TRAIN 8\numbers 8 K M.txt','r');
 Rlabel8=fread(Rlabel8ID);
 Rlabel8((Rlabel8==13))=[];
 Rlabel8((Rlabel8==10))=[];
 fclose(Rlabel8ID); 
  
%   for pp1=1:2:length(s1)-1
% a11(pp1)=s1(pp1);
%   end
%     a11(a11==0)=[];  
%     a22=char(a11);  
%     a38=a22(1:length(a22));
 cnet=csvread('netlist.txt');
[r c]=size(cnet);

for oo=1:1:r
az=cnet(oo,:);
az(az==0)=[];
    
    len=length(az);
    numbers=(len-2);
    
    CC=bwconncomp(h9);
 
   labelnumber=az(len);
  image2=ce(:,:,labelnumber); 
  %figure,imshow(image2);
    [C,S] = wavedec2(image2,1,'db2');
A= appcoef2(C,S,'db2',1);
vv(1,:)=A(:);


   label=knnclassify(vv,train2,s1);
   
   



if(label=='O')
        R=R+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
% Rvalues=len-3;       
  valuesR=0;   
  g1=0;
for g=3:1:len-1
            image=ce(:,:,az(g));
%             [C1,S1] = wavedec2(image,1,'db2');
%              A1= appcoef2(C1,S1,'db2',1);
%              vv1(1,:)=A1(:);
vv1(1,:)=image(:);
             sepa=bwconncomp(image);
             statschar=regionprops(sepa,'Eulernumber');
             g1=g1+1;
             if(statschar.EulerNumber==0)
               valuesR(g1)=knnclassify(vv1,Rtrain069,Rlabel069);
             end
             if(statschar.EulerNumber==1)
             valuesR(g1)=knnclassify(vv1,Rtrain123457,Rlabel123457);
             end
 
             if(statschar.EulerNumber<=-1)
             valuesR(g1)=knnclassify(vv1,Rtrain8,Rlabel8);
             end
             
             
end
        

       fid2=fopen('creatingnetlist12.txt','a');
        if(length(valuesR)==3)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c',R,az(1),az(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)));      
        end
           if(length(valuesR)==4)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c%c',R,az(1),az(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)),char(valuesR(4)));    
           end
            if(length(valuesR)==2)
            fprintf(fid2,'\r\nR%d  %d %d %c%c',R,az(1),az(2),char(valuesR(1)),char(valuesR(2)));    
          end
               if(length(valuesR)==5)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c%c%c',R,az(1),az(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)),char(valuesR(4)),char(valuesR(5)));    
               end
     if(length(valuesR)==1)
            fprintf(fid2,'\r\nR%d  %d %d %c',R,az(1),az(2),char(valuesR(1)));    
          end
    
    
    
    fclose(fid2);
end



end