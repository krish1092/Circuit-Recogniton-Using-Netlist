clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3079.jpg');
%imshow(i);
se=strel('diamond',2);

%i2=bwmorph(i1,'thin',inf);

i2=imresize(i1,[512 512],'bilinear');
%imshow(i1);
i2=imcomplement(im2bw(i2));
%i2=imclose(i2,se);
%i2=imdilate(i2,se);
%imshow(i2);
i2=imcrop(i2);
%i4=i3;
%imshow(i3);
i2=bwmorph(i2,'thin',inf);
%disp(size(i4));
%imshow(i4);
%i4=bwperim(i4);
%imshow(i4);
B=bwboundaries(i2,'noholes');
disp(B);

for i=1:1:length(B)
    b=B{i};
%[m n]=size(i2);
%i5=i4;
%i4=bound2im(b);
%[s,su]=bsubsamp(b,5);
%g2=bound2im(s,m,n);
%cn=connectpoly(s(:,1),s(:,2));
%g3=bound2im(cn);
c=fchcode(b);
x{i}=c;
disp(c);
end
for y=1:1:length(B)
len=length(x{y}.fcc);
for i=2:1:len
    if(x{y}.fcc(i)==0)
        x{y}.fcc(i)=0;
    end
    if(x{y}.fcc(i)==1 || x{y}.fcc(i)==7)
        if(x{y}.fcc(i+1)==0 || x{y}.fcc(i+2)==0 || x{y}.fcc(i+3)==0 || x{y}.fcc(i-1)==0 || x{y}.fcc(i-2)==0 || x{y}.fcc(i-3)==0)
            x{y}.fcc(i)=0;
        end
    end
    %if(x{y}.fcc(i)~=0 || x{y}.fcc(i)~=1 || x{y}.fcc(i)~=7)
    %end
    
   
  
end
for i=1:1:len
    if(x{y}.fcc(i)==4)
        x{y}.fcc(i)=4;
    end
    if(x{y}.fcc(i)==3 || x{y}.fcc(i)==5)
        if(x{y}.fcc(i+1)==0 || x{y}.fcc(i+2)==0 || x{y}.fcc(i+3)==0 || x{y}.fcc(i-1)==0 || x{y}.fcc(i-2)==0 || x{y}.fcc(i-3)==0)
            x{y}.fcc(i)=4;
        end
    end
    if(x{y}.fcc(i)~=4 || x{y}.fcc(i)~=5 || x{y}.fcc(i)~=3)
    end
    
   
  
end

for i=1:1:len
    if(x{y}.fcc(i)==6)
        x{y}.fcc(i)=6;
    end
    if(x{y}.fcc(i)==5 || x{y}.fcc(i)==7)
        if(x{y}.fcc(i+1)==6 || x{y}.fcc(i+2)==6 || x{y}.fcc(i+3)==6 || x{y}.fcc(i-1)==6 || x{y}.fcc(i-2)==6 || x{y}.fcc(i-3)==6)
            x{y}.fcc(i)=6;
        end
    end
    if(x{y}.fcc(i)~=6 || x{y}.fcc(i)~=5 || x{y}.fcc(i)~=7)
    end
    
   
  
end
for i=1:1:len
    if(x{y}.fcc(i)==2)
        x{y}.fcc(i)=2;
    end
    if(x{y}.fcc(i)==1 || x{y}.fcc(i)==3)
        if(x{y}.fcc(i+1)==2 || x{y}.fcc(i+2)==2 || x{y}.fcc(i+3)==2 || x{y}.fcc(i-1)==2 || x{y}.fcc(i-2)==2 || x{y}.fcc(i-3)==2)
            x{y}.fcc(i)=2;
        end
    end
    if(x{y}.fcc(i)~=2 || x{y}.fcc(i)~=2 || x{y}.fcc(i)~=2)
    end
    
   
  
end
end


 
