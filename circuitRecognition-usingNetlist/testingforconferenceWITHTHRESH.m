  clc;
 clear all;
 close all;

 i1=imread('C:\Users\kalki\Pictures\New Folder\IMG_4151.jpg');
% %i1=imcrop(i1);
% %se=strel('diamond',2);
% %i2=bwmorph(i1,'thin',inf);
% 
i2=imcrop(i1);
tic; 
i2=imresize(i2,[512 512],'bilinear');
 i2=rgb2gray(i2);
% 
 i2=imadjust(i2);
% %imshow(i1);
 i2=imcomplement(im2bw(i2));
% %isw;
% cc=bwconncomp(i2);
% stats = regionprops(cc, 'area');
% ind = find([stats.Area] < 10 );
% sta = regionprops(cc, 'PixelList');
% for i=1:1:length(ind)
%    [b1,c1]=size(sta(ind(i)).PixelList);
%     
%     for j=1:1:b1
%    
%         y1=sta(ind(i)).PixelList(j,1);
%     x1=sta(ind(i)).PixelList(j,2);
%     i2(x1,y1)=0;
%  end
% end
% 
% i444=i2;
% imtool(i2);
% % isw;

%i31=i444;
%i2=i444;
i31=i2;
%i2=imclose(i2,se);
%i2=imdilate(i2,se);
%imshow(i2);
%i2=imcrop(i2);
i2=bwmorph(i2,'thin',inf);
%disp(size(i4));
%imshow(i4);
%i4=bwperim(i4);
%imshow(i4);
i2=bwmorph(i2,'clean');
%imtool(i2);
CC=bwconncomp(i2);
stats = regionprops(CC, 'area');
idx = find([stats.Area] < 100 );
stats = regionprops(CC, 'PixelList');
bb=length(idx);
[r,c]=size(i2);
i34=i2;
%i7=zeros(512,512);
for i=1:1:bb
   b1=length(stats(idx(i)).PixelList);
    
    for j=1:1:b1
   
        y1=stats(idx(i)).PixelList(j,1);
    x1=stats(idx(i)).PixelList(j,2);
    i34(x1,y1)=0;
 end

end
%imtool(i34);
%i7=bwmorph(i7,'clean');


%d=cellfun('length',B);
%[maxd,k]=max(d);
[m5,n5]=size(i2);
 %i5=zeros([m5 n5]);
 for i=2:1:m5-1
    for j=2:1:n5-3
        if(i2(i,j)==1)
            %if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           if(i34(i,j+1)==1 || i34(i,j+2)==1 || i34(i,j+3)==1) % || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
                v1(i,j)=1;
            else
                v1(i,j)=0;
            end
        end
    end
 end
 
 [r,c]=size(v1);
for i=2:1:r-1
a=0;
    for j=2:1:c-1

if(v1(i,j)==1)
a=a+1;
end
end
if(a<=4)
for j=2:1:c-1
    v1(i,j)=0;    
end
end
end
imshow(v1);
%imtool(v1);
se=strel('square',3);


a2=imclose(v1,se);
a3=bwmorph(a2,'clean');


a4=imdilate(a3,se);
%imshow(a4);
a5=bwmorph(a4,'thin');
%imshow(a5);9
CC = bwconncomp(a5,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 20);
stats = regionprops(CC, 'PixelList');
b=length(idx);
[r,c]=size(a5);
i5=zeros(512,512);
for i=1:1:b
    b1=length(stats(idx(i)).PixelList);
    q=sort(stats(idx(i)).PixelList);
    
    y1=q(1,1);
    x1=q(1,2);
    y2=q(b1,1);
    x2=q(b1,2);
    
    %DD=sqrt(((x1-x2).^2) +((y1-y2).^2));
   %if(DD>=4)
    %i5(x1,y1:y2)=1;
   %else
     %   y2=stats(idx(i)).PixelList(b1-DD,1);
   % x2=stats(idx(i)).PixelList(b1-DD,2);
       i5(x1,y1:y2)=1;
   %end
end
%imtool(i5);

for j=2:1:n5-1
    for i=2:1:m5-3
        if(i2(i,j)==1)
            %if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           if(i34(i+1,j)==1 || i34(i+2,j)==1 || i34(i+3,j)==1) % || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
                v1(i,j)=1;
            else
                v1(i,j)=0;
            end
        end
    end
 end
 
%  [r,c]=size(v1);
% for j=2:1:c-1
% a=0;
%     for i=2:1:r-1
% 
% if(v1(i,j)==1)
% a=a+1;
% end
% end
% if(a<=5)
% for i=2:1:r-1
%     v1(i,j)=0;    
% end
% end
% end
%imshow(v1);
%i31=bwmorph(i31,'clean');
%imtool(v1);
CC=bwconncomp(i31);
stats = regionprops(CC, 'area');
idx = find([stats.Area] < 10);
stats = regionprops(CC, 'PixelList');
bb=length(idx);
[r,c]=size(i31);
for i=1:1:bb
    
    [b1,b2]=size(stats(idx(i)).PixelList);
    if(b1<10)
    for j=1:1:b1
   
        y1=stats(idx(i)).PixelList(j,1);
    x1=stats(idx(i)).PixelList(j,2);
    i31(x1,y1)=0;
 end
    end
end
CC=bwconncomp(i31);
stats = regionprops(CC, 'area');
idx = find([stats.Area] < 250);
stats = regionprops(CC, 'PixelList');
bb=length(idx);
[r,c]=size(i31);
i7=zeros(512,512);
for i=1:1:bb
    
    b1=length(stats(idx(i)).PixelList);
    if(b1>2)
    for j=1:1:b1
   
        y1=stats(idx(i)).PixelList(j,1);
    x1=stats(idx(i)).PixelList(j,2);
    i7(x1,y1)=1;
 end
    end
end

i7=bwmorph(i7,'clean');
%i7(440:452,460:472)=1;
imtool(i7);

se=strel('square',3);


a2=imclose(v1,se);
a3=bwmorph(a2,'clean');


a4=imdilate(a3,se);
%imshow(a4);
a5=bwmorph(a4,'thin');
%imshow(a5);
[r,c]=size(v1);


CC = bwconncomp(a5,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 20);

stats = regionprops(CC, 'PixelList');

b=length(idx);


for i=1:1:b
    b1=length(stats(idx(i)).PixelList);
    q=sort(stats(idx(i)).PixelList);
    
    y1=q(1,1);
    x1=q(1,2);
    y2=q(b1,1);
    x2=q(b1,2);
    
    i5(x1:x2,y1)=1;
end

%i5=imcrop(i5);
i5=bwmorph(i5,'clean'); % VV important

imtool(i5);
 i6=i5;
 i5=i6;
kk=1;
sr=0;


i5=i6;
%i5(142:146,381)=1;
%isw;
%nojoin=[];
for i=1:1:512
    dist1=0;
    dist2=0;
    dist3=0;
    for j=1:1:512
        if((i5(i,j)==1 && i5(i,j-1)==0 && i5(i,j+1)==1) ||(i5(i,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1)&& dist1<30)
            k=1;
            dist1=dist1+1;
            count=0;
            while(i5(i-k,j)==0 && k<25 && count==0 )
                k=k+1;
                s=k;
                if(i5(i-k,j)==1)
                    %here
                    m=1;
                    if(i5(i-k,j)==1 && count==0)
                        count=1;
                        if((j>41 && j<470) && (i5(i,j-26)~=1 && i5(i,j+26)~=1))
                            i5(i-k-3:i+5,j-40:j+40)=0;
                        end
                        if((j<=41) && (i5(i,j-26)~=1 && i5(i,j+26)~=1))
                            i5(i-k-3:i+5,j-30:j+40)=0;
                        end
                        if((j>470) && (i5(i,j-26)~=1 && i5(i,j+26)~=1))
                            i5(i-4:i+k+4,j-40:j+30)=0;
                        end
                    end
                end
            end
            k=1;
            count2=0;
            while(i5(i+k,j)==0 && k<25 &&count2==0 )
                k=k+1;
                s=k;
                if(i5(i+k,j)==1)
                    %here
                    m=1;
                    if(i5(i+k,j)==1 && count2==0)
                        count2=1;
                        
                        if((j>41 && j<470) && (i5(i,j-26)~=1 && i5(i,j+26)~=1))
                            i5(i-4:i+k+4,j-40:j+40)=0;
                        end
                        if((j<=41) && (i5(i,j-24)~=1 && i5(i,j+26)~=1))
                            i5(i-4:i+k+4,j-20:j+40)=0;
                        end
                        if((j>470) && (i5(i,j-26)~=1 && i5(i,j+26)~=1))
                            i5(i-4:i+k+4,j-40:j+30)=0;
                        end
                    end
                end
            end
        end
            if(((i5(i,j)==1 && i5(i-1,j)==0 && i5(i+1,j)==1) ||(i5(i,j)==1 && i5(i-1,j)==1 && i5(i+1,j)==1))&& dist2<30)
            k=1;
            dist2=dist2+1;
            count=0;
            
            while(i5(i,j-k)==0 && k<25 && count==0 )
                k=k+1;
                s=k;
                if(i5(i,j-k)==1)
                    if(i5(i,j-k)==1 && count==0)
                            count=1;
                            if((i>41 && i<470) && (i5(i-26,j)~=1 && i5(i+26,j)~=1))
                                i5(i-40:i+40,j-k-4:j+5)=0;
                            end
                            if((i<=41) && (i5(i-26,j)~=1 && i5(i+26,j)~=1))
                                i5(i-30:i+35,j-k-4:j+5)=0;
                            end
                            if(i>470 && (i5(i-26,j)~=1 && i5(i+26,j)~=1))
                                i5(i-40:i+30,j-4:j+k+4)=0;
                            end
                    end
                end
            end
            k=1;
            count2=0;
            while(i5(i,j+k)==0 && k<25 &&count2==0 )
                k=k+1;
                if(i5(i,j+k)==1)
                    %here
                    m=1;
                    if(i5(i,j+k)==1 && count2==0)
                        count2=1;
                        
                        if((i>41 && i<470) && (i5(i-26,j)~=1 && i5(i+26,j)~=1))
                            i5(i-40:i+40,j-4:j+k+4)=0;
                        end
                        if((i<=41) && (i5(i-26,j)~=1 && i5(i+26,j)~=1))
                            i5(i-30:i+40,j-4:j+k+4)=0;
                        end
                        if(i>470 && (i5(i-26,j)~=1 && i5(i+26,j)~=1))
                            i5(i-40:i+30,j-4:j+k+4)=0;
                        end
                    end
                end
            end
            end
    end
end
imtool(i5);
%imtool(i6);

% imtool(i5);
%imtool(i6);
%imtool(i45);
cob=bwconncomp(i5);   
 statso=regionprops(cob,'PixelList');
 %currently working
% 
% for i=1:1:length(statso)
%     for h=1:1:length(statso(i).PixelList)
%         x3=statso(i).PixelList(h,2);
%         y3=statso(i).PixelList(h,1);
%         if(i5(x3-1,y3)==0 && i5(x3+1,y3)==1)
%             j=1;
%             while(i5(x3+j,y3)~=0 && j<14)
%                 j=j+1;
%                 if(i5(x3+j,y3-1)==1 || i5(x3+j,y3-2)==1 || i5(x3+j,y3-3)==1 || i5(x3+j,y3-4)==1 || i5(x3+j,y3-5)==1|| i5(x3+j,y3+1)==1 || i5(x3+j,y3+2)==1 || i5(x3+j,y3+3)==1 || i5(x3+j,y3+4)==1 || i5(x3+j,y3+5)==1 || i5(x3+j+1,y3+1)==1 || i5(x3+j+1,y3+2)==1 || i5(x3+j+1,y3+3)==1 || i5(x3+j+2,y3+1)==1 || i5(x3+j+2,y3+2)==1)
%                     i5(x3:x3+j,y3)=0;
%                     k=1;
%                     while(i5(x3+j+k,y3)~=0 && j>10)
%                         i5(x3+j:x3+j+k,y3)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         
%         if(i5(x3-1,y3)==1 && i5(x3+1,y3)==0)
%             j=1;
%             while(i5(x3-j,y3)~=0 && j<14)
%                 j=j+1;
%                 if(i5(x3-j,y3-1)==1 || i5(x3-j,y3-2)==1 || i5(x3-j,y3-3)==1 || i5(x3-j,y3-4)==1 || i5(x3-j,y3-5)==1 || i5(x3-j,y3+1)==1 || i5(x3-j,y3+2)==1 || i5(x3-j,y3+3)==1 || i5(x3-j,y3+4)==1 || i5(x3-j,y3+5)==1 || i5(x3-j-1,y3+1)==1 || i5(x3-j-1,y3+2)==1 || i5(x3-j-2,y3+1)==1 || i5(x3-j-2,y3+2)==1)
%                     i5(x3-j:x3,y3)=0;
%                     k=1;
%                     while(i5(x3-j-k,y3)~=0 && j>10)
%                         i5(x3-j-k:x3-j,y3)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         
%                     
%         
%         if(i5(x3,y3-1)==0 && i5(x3,y3+1)==1)
%             j=1;
%             while(i5(x3,y3+j)~=0 && j<14)
%                 j=j+1;
%                 if(i5(x3-1,y3+j)==1 || i5(x3-2,y3+j)==1 || i5(x3-3,y3+j)==1 ||i5(x3-4,y3+j)==1 || i5(x3-5,y3+j)==1 ||i5(x3+1,y3+j)==1 || i5(x3+2,y3+j)==1 || i5(x3+3,y3+j)==1 ||i5(x3+4,y3+j)==1 || i5(x3+5,y3+j)==1 || i5(x3-1,y3+j+1)==1 || i5(x3-2,y3+j+1)==1  || i5(x3+1,y3+j+1)==1 || i5(x3+2,y3+j+1)==1 || i5(x3+2,y3+j+3)) 
%                     i5(x3,y3:y3+j)=0;
%                     k=1;
%                     while(i5(x3,y3+j+k)~=0 && j>10)
%                         i5(x3,y3+j:y3+j+k)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         
%         if(i5(x3,y3-1)==1 && i5(x3,y3+1)==0)
%             j=1;
%             while(i5(x3,y3-j)~=0 && j<14)
%                 j=j+1;
%                 if(i5(x3-1,y3-j)==1 || i5(x3-2,y3-j)==1 || i5(x3-3,y3-j)==1 || i5(x3-4,y3-j)==1 || i5(x3-5,y3-j)==1 || i5(x3+1,y3-j)==1 || i5(x3+2,y3-j)==1 || i5(x3+3,y3-j)==1 || i5(x3+4,y3-j)==1 || i5(x3+5,y3-j)==1|| i5(x3-1,y3-j-1)==1 || i5(x3-2,y3-j-1)==1 || i5(x3-1,y3-j-2)==1 || i5(x3-2,y3-j-2)==1 || i5(x3+1,y3-j-1)==1 || i5(x3+2,y3-j-1)==1 )
%                     i5(x3,y3-j:y3)=0;
%                     k=1;
%                     while(i5(x3,y3-j-k)~=0 && j>10)
%                         i5(x3,y3-j-k:y3-j)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         
%         
%         
%         
%     end
% end

 
%imtool(i5);
%imtool(i465);
%imshow(i45);
xkr=[1 1 1;1 0 1;1 1 1];
i45=i5;
cob=bwconncomp(i45,8);
statsob=regionprops(cob,'PixelList');

[i5xs,i5ys]=size(i45);
%xkr=double(xkr);
%i45=im2double(i45);
for i=1:1:length(statsob)-1
    

    jsiz=length(statsob(i).PixelList);
    for jj=i+1:1:length(statsob)
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        
       %while(kkr==0 && (isempty(find((x1==nojoin(:,1)) & (y1==nojoin(:,2))==1, 1))==1))
        %if((x1<i5xs) && (y1<i5ys))
        
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<15)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<15)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 15) && (abs(y1-y2))<15))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                   
            
            
            end
             
           end
           end        
        end
        end
        end
end


for i=length(statsob):-1:2
    jsiz=length(statsob(i).PixelList);
    for jj=i-1:-1:1
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        
        
        
        
        %if((x1<i5xs) && (y1<i5ys))
        
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<15)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<15)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 15) && (abs(y1-y2))<15))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                   
                end
            end
             
           end
                      
        end
        end
    end
    end

imtool(i45);
%imtool(i6667);
% cob=bwconncomp(i45,8);
% statsob=regionprops(cob,'PixelList');
% for i=1:1:length(statsob)
%     if(length(statsob(i).PixelList)<40)
%         
%     for j=1:1:length(statsob(i).PixelList)
%         x11=statsob(i).PixelList(j,2);
%         y11=statsob(i).PixelList(j,1);
%         i45(x11,y11)=0;
%     end
%     end
% end
i45=bwmorph(i45,'spur');
%i45=imcrop(i45);
i45=bwmorph(i45,'clean');
cob=bwconncomp(i45,8);
vv=labelmatrix(cob);
vv1=label2rgb(vv);
statsob=regionprops(cob,'PixelList');

       
for i=1:1:length(statsob)
    siz1=length(statsob(i).PixelList);
        for ii=1:1:siz1
             
            x4=statsob(i).PixelList(ii,2);
            y4=statsob(i).PixelList(ii,1);
            
            if(i45(x4,y4-1)==1 && i45(x4-1,y4)==1)
                j=1;
                while(i45(x4-j,y4)~=0 && j<16)
                    
                    j=j+1;
                    kk=1;
                    while(i45(x4-j,y4+kk)~=0)
                        i45(x4,y4+kk)=1;
                        i45(x4-j,y4+kk)=0;
                        kk=kk+1;
                    end
                    
                end
                if(i45(x4-j-1,y4)==0)
                i45(x4-j:x4-1,y4)=0;
                end
            end
                if(i45(x4,y4-1)==1 && i45(x4-1,y4)==1)
                    j=1;
                    while(i45(x4,y4-j)~=0 && j<16)
                    
                    j=j+1;
                    kk=1;
                    while(i45(x4+kk,y4-j)~=0)
                        i45(x4+kk,y4)=1;
                        i45(x4+kk,y4-j)=0;
                        kk=kk+1;
                    end
                   
                    end
                    if(i45(x4,y4-j-1)==0)
                 i45(x4,y4-j:y4-1)=0;
                    end
            end
         if(i45(x4+1,y4)==1 && i45(x4,y4-1)==1)
                j=1;
               while(i45(x4+j,y4)~=0 && j<16)
                    
                   j=j+1;
                    kk=1;
                    while(i45(x4+j,y4+kk)~=0)
                        i45(x4,y4+kk)=1;
                        i45(x4+j,y4+kk)=0;
                        kk=kk+1;
                    end
                    
               end
               if(i45(x4+j+1,y4)==0)
               i45(x4+1:x4+j,y4)=0;
               end
            end
             if(i45(x4-1,y4)==1 && i45(x4,y4+1)==1)
                j=1;    
               while(i45(x4,y4+j)~=0 && j<16)
                   
                   j=j+1;
                    kk=1;
                    while(i45(x4+kk,y4+j)~=0)
                        i45(x4+kk,y4)=1;
                        i45(x4+kk,y4+j)=0;
                        kk=kk+1;
                        
                    end
                    
               end
               if(i45(x4,y4+j+1)==0)
            i45(x4,y4+1:y4+j)=0;
               end
           end
 
        end
end

for i=2:1:511
    for j=2:1:511
        
        if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i+1,j)==1 && i5(i,j+1)==1))
            kr=1;    
            while(i5(i+kr,j)~=0 && kr<8)
                %xkrw=kr;
                
                  if(i5(i+kr+1,j)==0)
             i5(i+1:i+kr,j)=0;
                  end
             kr=kr+1;      
            end
        end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;    
         
            while(i5(i-kr,j)~=0 && kr<8)
               % xkrw=kr;
                 
                 if(i5(i-kr-1,j)==0)
            i5(i-kr:i-1,j)=0;
                 end
            kr=kr+1;     
            end
           end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;    
        
            while(i5(i,j+kr)~=0 && kr<8)
                if(i5(i,j+kr+1)==0)
                    i5(i,j+1:j+kr)=0;
                end
                kr=kr+1;
            end
           end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;
            while(i5(i,j-kr)~=0 && kr<8)
            if(i5(i,j-kr-1)==0)
             i5(i,j-kr:j-1)=0;
            end
            kr=kr+1;
            end
         end    
   
    end
end
cob=bwconncomp(i45,8);
statsob=regionprops(cob,'PixelList');

[i5xs,i5ys]=size(i45);
%xkr=double(xkr);
%i45=im2double(i45);
i5=bwmorph(i5,'spur');

for i=1:1:length(statsob)-1
    jsiz=length(statsob(i).PixelList);
    for jj=length(statsob):-1:1
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        
        %if((x1<i5xs) && (y1<i5ys))
        
        %if((x1<i5xs) && (y1<i5ys))
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<16)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<16)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 15) && (abs(y1-y2))<15))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                end
            end
            end   
        end
        end
    end
    end

for i=length(statsob):-1:2
    jsiz=length(statsob(i).PixelList);
    for jj=1:1:length(statsob)
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        
        %if((x1<i5xs) && (y1<i5ys))
        
        %if((x1<i5xs) && (y1<i5ys))
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<15)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<15)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 15) && (abs(y1-y2))<15))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                   
          
            end
             
           end
           end          
        end
        end
    end
    end

i46=i5;
%imtool(i46);
%imtool(i677);
i5=i45;

xkr=[1 1 1;1 0 1;1 1 1];
%imtool(i5);
% xkr=double(xkr);
% cob=bwconncomp(i5);   
% statsob=regionprops(cob,'PixelList');
i65=i5;

                

%imtool(i5);
%imtool(i567);
for i=2:1:511
    for j=2:1:511
        
        if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i+1,j)==1 && i5(i,j+1)==1))
            kr=1;    
            while(i5(i+kr,j)~=0 && kr<11)
                %xkrw=kr;
                
                  if(i5(i+kr+1,j)==0)
             i5(i+1:i+kr,j)=0;
                  end
             kr=kr+1;      
            end
        end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;    
         
            while(i5(i-kr,j)~=0 && kr<11)
               % xkrw=kr;
                 
                 if(i5(i-kr-1,j)==0)
            i5(i-kr:i-1,j)=0;
                 end
            kr=kr+1;     
            end
           end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;    
        
            while(i5(i,j+kr)~=0 && kr<11)
                if(i5(i,j+kr+1)==0)
                    i5(i,j+1:j+kr)=0;
                end
                kr=kr+1;
            end
           end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;
            while(i5(i,j-kr)~=0 && kr<11)
            if(i5(i,j-kr-1)==0)
             i5(i,j-kr:j-1)=0;
            end
            kr=kr+1;
            end
         end    
   
    end
end
for i=2:1:511
    for j=2:1:511
        if((i5(i-1,j)==1 && i5(i,j)==0 && i5(i,j+1)==1 && i5(i+1,j)==0 && i5(i,j-1)==0) && i5(i-1,j-1)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0 )
            i5(i,j)=1;
        end
        if((i5(i-1,j)==1 && i5(i,j)==0 && i5(i,j+1)==0 && i5(i+1,j)==0 && i5(i,j-1)==1)&& i5(i-1,j-1)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
            i5(i,j)=1;
        end
        if((i5(i-1,j)==0 && i5(i,j)==0 && i5(i,j+1)==0 && i5(i+1,j)==1 && i5(i,j-1)==1)&& i5(i-1,j-1)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
            i5(i,j)=1;
        end
        if(i5(i-1,j)==0 && i5(i,j)==0 && i5(i,j+1)==1 && i5(i+1,j)==1 && i5(i,j-1)==0 && i5(i-1,j-1)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
            i5(i,j)=1;
        end
            
    end
end
i5=bwmorph(i5,'spur');
% i5(450:467,43)=0;
% i5(450:467,176)=0;
imtool(i5);

for i=2:1:511
    
    for j=2:1:511
        if(i5(i,j)==1)
            if(i5(i,j-1)==1 && i5(i,j+1)==0 && i5(i-1,j-1)==0  && i5(i-1,j)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j)==0 && i5(i+1,j+1)==0)
            leftnode=[i j];
            dlmwrite('leftnode.txt',leftnode,'-append', ...
             'newline', 'pc');
            end
            if(i5(i,j+1)==1 && i5(i,j-1)==0 && i5(i-1,j-1)==0  && i5(i-1,j)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j)==0 && i5(i+1,j+1)==0)
            rightnode=[i j];
            dlmwrite('rightnode.txt',rightnode,'-append', ...
             'newline', 'pc');
            end
            
        end
end
end

for j=2:1:511
    for i=2:1:511
        if(i5(i,j)==1)
            if(i5(i-1,j)==1 && i5(i+1,j)==0 && i5(i-1,j-1)==0  && i5(i-1,j+1)==0 && i5(i,j-1)==0 && i5(i,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
            upnode=[i j];
            dlmwrite('upnode.txt',upnode,'-append', ...
             'newline', 'pc');
            end
            if(i5(i-1,j)==0 && i5(i+1,j)==1 && i5(i-1,j-1)==0  && i5(i-1,j+1)==0 && i5(i,j-1)==0 && i5(i,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
            downnode=[i j];
            dlmwrite('downnode.txt',downnode,'-append', ...
             'newline', 'pc');
            end
            
        end        
    end
end
if(exist('leftnode.txt') && exist('rightnode.txt'))
left=csvread('leftnode.txt');
right=csvread('rightnode.txt');
[r c]=size(left);
if(r>1)
    k=[];
 for i=1:1:length(left)
     x1=left(i,1);
     y1=left(i,2);
 for j=1:1:length(right)    
     x2=right(j,1);
     y2=right(j,2);
     k(i,j)=2000;
%if(i1(x2,y1:y2)~=0 || i1(x1,y1:y2)~=0)
    if(y1<y2)
k(i,j)=sqrt((abs(x1-x2).^2) + (abs(y1-y2).^2));
    end
end
 
 mini=min(k(i,:));
 [x,y]=find(k==mini);
 leftu=[left(i,1) left(i,2)];
            dlmwrite('corresLEFT.txt',leftu,'-append', ...
              'newline', 'pc');

 rightu=[right(y,1) right(y,2)];
            dlmwrite('corresRIGHT.txt',rightu,'-append', ...
              'newline', 'pc');
 
 end
end
end
 if(exist('upnode.txt') && exist('downnode.txt'))
 up=csvread('upnode.txt');

down=csvread('downnode.txt');
[r1 c1]=size(up);
if(r1>1)
    k=[];
 for i=1:1:length(up)
     x1=up(i,1);
     y1=up(i,2);
 for j=1:1:length(down)    
     x2=down(j,1);
     y2=down(j,2);
     k(i,j)=2000;
%if(i1(x2,y1:y2)~=0 || i1(x1,y1:y2)~=0)
    if(x1<x2)
k(i,j)=sqrt((abs(x1-x2).^2) + (abs(y1-y2).^2));
    end
end
 
 mini=min(k(i,:));
 [x,y]=find(k==mini);
 upu=[up(i,1) up(i,2)];
            dlmwrite('corresup.txt',upu,'-append', ...
              'newline', 'pc');

 downu=[down(y,1) down(y,2)];
            dlmwrite('corresdown.txt',downu,'-append', ...
              'newline', 'pc');
 
 end
end 
end

if(r>1 && exist('corresLEFT.txt'))
left1=csvread('corresLEFT.txt');

%right=csvread('rightnode.txt');

aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(left1)
    x1=left1(i,1);
    y1=left1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                %disp(y2);
                dlmwrite('mergedleftnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
if(exist('corresRIGHT.txt'))
right1=csvread('corresRIGHT.txt');


%right=csvread('rightnode.txt');

aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(right1)
    x1=right1(i,1);
    y1=right1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                %disp(y2);
                dlmwrite('mergedrightnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
end
end
if(r1>1 && exist('corresup.txt'))
up1=csvread('corresup.txt');


%right=csvread('rightnode.txt');

aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(up1)
    x1=up1(i,1);
    y1=up1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                %disp(y2);
                dlmwrite('mergedupnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
if(exist('corresdown.txt'))
down1=csvread('corresdown.txt');


%right=csvread('rightnode.txt');

aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(down1)
    x1=down1(i,1);
    y1=down1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                %disp(y2);
                dlmwrite('mergeddownnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
end
end


if(r1==1 && exist('downnode.txt'))
    down=csvread('downnode.txt');
    aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=down(1,1);
    y1=down(1,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                disp(y2);
                dlmwrite('mergeddownnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
%end
if(exist('upnode.txt'))
up=csvread('upnode.txt');
%if(length(up)==1)
    aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=up(1,1);
    y1=up(1,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                %disp(y2);
                dlmwrite('mergedupnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
end
if(exist('leftnode.txt'))
left=csvread('leftnode.txt');
[r c]=size(left);
if(r==1)
    
    aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=left(1,1);
    y1=left(1,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                disp(y2);
                dlmwrite('mergedleftnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
end
if(exist('rightnode.txt'))
right=csvread('rightnode.txt');
%if(length(right)==1)
    aa=bwconncomp(i5);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=right(1,1);
    y1=right(1,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                %disp(y2);
                dlmwrite('mergedrightnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
if(exist('leftnode.txt'))
[r c]=size(csvread('leftnode.txt'));
end
CC=bwconncomp(i7);
 stats=regionprops(CC,'BoundingBox');
 for i=1:1:length(stats)
 centroid(i,:)=[stats(i).BoundingBox(1,1)+(stats(i).BoundingBox(1,3))/2 stats(i).BoundingBox(1,2)+(stats(i).BoundingBox(1,4))/2];
 %xyz=[centroid(i,:) stats(i).BoundingBox(1,:)];
 centroidindex(i,:)=[centroid(i,:) i];
 end

if(r==1 && exist('leftnode.txt'))
 m1=csvread('leftnode.txt');
% m1=m1(2,:);
end
 if( r~=1 && exist('corresLEFT.txt'))
     m1=csvread('corresLEFT.txt');
 end
     

     dist=[];
 if(exist('m1'))
  [xm,ym]=size(m1);
 
 for ii=1:1:xm
 jj=1;
 j=1;
 for i=1:1:length(centroid)
    
     
         
     if(centroid(i,2)<m1(ii,1))
         dist(jj,1)=sqrt(((centroid(i,2)-m1(ii,1)).^2) + ((centroid(i,1)-m1(ii,2)).^2));
         dist(jj,2)=i;
         jj=jj+1;
              
     end
  
 end
     xdd=min(dist(:,1));
 
 [xd,yd]=find(dist==xdd);
 yy(ii,1)=dist(xd,2);
 
    for i=1:1:length(centroid)
        y5=centroid(yy(ii,1),1);
        x5=centroid(yy(ii,1),2);
        y6=centroid(i,1);
        x6=centroid(i,2);
        sq(j,1)=sqrt(((x6-x5).^2) +((y6-y5).^2));
        if(sq(j,1)<40 && sq(j,1)~=0)
            xl=[yy(ii,1) i];
            dlmwrite('centroidseqleft.txt',xl,'-append', ...
              'newline', 'pc');
            yy(ii,1)=i;
        end
        j=j+1;
    end
 end
 end
% m1=[];
 if(exist('upnode.txt'))
 [r1 c1]=size(csvread('upnode.txt'));
 end
 if(r1==1 && exist('upnode.txt'))
 m1=csvread('upnode.txt');
% m1=m1(2,:);
 end
 if(r1~=1 && exist('corresup.txt'))
     m1=csvread('corresup.txt');
 end
 if(exist('m1'))
  [xm,ym]=size(m1);
  
 for ii=1:1:xm
    kk=1;  
    jj=1;  
    for i=1:1:length(centroid)
      if(centroid(i,1)>m1(ii,2))
         distp(kk,1)=sqrt(((centroid(i,2)-m1(ii,1)).^2) + ((centroid(i,1)-m1(ii,2)).^2));
         distp(kk,2)=i;
         kk=kk+1;
      end
    end
     ydd=min(distp(:,1));
     [xpd,ypd]=find(distp==ydd);
     xx(ii,1)=distp(xpd,2);
     for i=1:1:length(centroid)
        y5=centroid(xx(ii,1),1);
        x5=centroid(xx(ii,1),2);
        y6=centroid(i,1);
        x6=centroid(i,2);
        sq(jj,1)=sqrt(((x6-x5).^2) +((y6-y5).^2));
        if(sq(jj,1)<40 && sq(jj,1)~=0)
            xu=[xx(ii,1) i];
            dlmwrite('centroidsequp.txt',xu,'-append', ...
              'newline', 'pc');
            xx(ii,1)=i;
        end
        jj=jj+1;
     end
 end

 end
 if(exist('centroidseqleft.txt'))
obleft=csvread('centroidseqleft.txt');

%for j=1:1:length(obleft)
    %a=0;
    a=0;
    for i=1:1:length(obleft)-1
x1=obleft(i,1);
y1=obleft(i,2);
y2=obleft(i+1,2);
x2=obleft(i+1,1);
if(x2~=y1)
%%disp(y1);
a=a+1;
vxz(a)=i;
disp(a);
end
    end
    vxz(a+1)=length(obleft);
    
    
%d=(vx(2)-vx(1))*2;

ar1=[];
    for j=1:1:vxz(1)
        for k=1:1:2
        ar1(j*k)=obleft(j,k);
       
        end
    end
        ar1=unique(ar1(:));
        ar1(ar1==0)=[];
 dlmwrite('leftobj.txt',ar1','-append', ...
              'newline', 'pc');       
if(length(vxz)>1)    
ar2=[];
 for i=1:1:length(vxz)-1
     a=vxz(i);
    b=vxz(i+1);
    %diff=b-a;
    g=0;
    for j=a+1:1:b
        for k=1:1:2
            g=g+1;
        ar2(g)=obleft(j,k);
%        disp(g);
        end
    end
    
        ar2=unique(ar2(:));
        ar2(ar2==0)=[];
 dlmwrite('leftobj.txt',ar2','-append', ...
              'newline', 'pc');   
    
 end

end
 end
 if(exist('centroidsequp.txt'))
 obup=csvread('centroidsequp.txt');
a=0;
    for i=1:1:length(obup)-1
x1=obup(i,1);
y1=obup(i,2);
y2=obup(i+1,2);
x2=obup(i+1,1);
if(x2~=y1)
%%disp(y1);
a=a+1;
vx1(a)=i;
end
end
vx1(a+1)=length(obup);
    
%d=(vx1(2)-vx1(1))*2;
ar1=[];
for j=1:1:vx1(1)
    for k=1:1:2
        ar1(j*k)=obup(j,k);
       
end
end
        ar1=unique(ar1(:));
        ar1(ar1==0)=[];
 dlmwrite('upobj.txt',ar1','-append', ...
              'newline', 'pc');       
if(length(vx1)>1)    
ar2=[];
 for i=1:1:length(vx1)-1
     a=vx1(i);
    b=vx1(i+1);
    %diff=b-a;
    g=0;
   
    for j=a+1:1:b
        for k=1:1:2
            g=g+1;
        ar2(g)=obup(j,k);
       %disp(g);
        end
    end
    
        ar2=unique(ar2(:));
        ar2(ar2==0)=[];
 dlmwrite('upobj.txt',ar2','-append', ...
              'newline', 'pc');   
    
 end
 
end

 end
if(exist('mergeddownnode.txt'))
 downnode=csvread('mergeddownnode.txt');
end
if(exist('mergedupnode.txt'))
upnode=csvread('mergedupnode.txt');
end
if(exist('mergedleftnode.txt'))
leftnode=csvread('mergedleftnode.txt');
end
if(exist('mergedrightnode.txt'))
rightnode=csvread('mergedrightnode.txt');
end
if(exist('leftobj.txt'))
obleft=csvread('leftobj.txt');
end
if(exist('upobj.txt'))
obup=csvread('upobj.txt');
end
if(exist('leftnode.txt'))
for i=1:1:length(leftnode)
    a=[leftnode(i) rightnode(i) obleft(i,:)];
    a(a==0)=[];
    dlmwrite('netlist.txt',a,'-append', ...
              'newline', 'pc');
end
end
if(exist('upnode.txt'))
for i=1:1:length(upnode)
    a=[upnode(i) downnode(i) obup(i,:)];
    a(a==0)=[];
    dlmwrite('netlist.txt',a,'-append', ...
              'newline', 'pc');
end
end
 
% clear all;
% i7=imread('D:\Studies\Softwares\Matlab\Templates\Characters&netlist\character1withG.jpg');
% i7=im2bw(i7);
rt=bwconncomp(i7);
stats=regionprops(rt,'BoundingBox');

 for i=1:1:length(stats)
 centroid(i,:)=[stats(i).BoundingBox(1,1)+(stats(i).BoundingBox(1,3))/2 stats(i).BoundingBox(1,2)+(stats(i).BoundingBox(1,4))/2];
 end
 
 for i=1:1:length(centroid)
     k=1;
     sq=[];
     for j=length(centroid):-1:1
         if(j~=i)
             sq(k,1)=sqrt(((centroid(i,1)-centroid(j,1)).^2)+(centroid(i,2)-centroid(j,2)).^2);
             k=k+1;
         end
     end
     if(sq(:)>30)
         ground=i;
     end
 end

be=bwconncomp(i5);
stat=regionprops(be,'PixelList');
count=0;
for i=1:1:length(stat)
    if(count==0)
    for j=1:1:length(stat(i).PixelList)
        x=stat(i).PixelList(j,2);
        y=stat(i).PixelList(j,1);
        if(sqrt(((centroid(ground,2)-x).^2)+(centroid(ground,1)-y).^2) < 60)
            grnode=i;
            count=1;
        end
    end
    end
end
if(exist('netlist.txt'))
    mt=csvread('netlist.txt');
    disp(mt);
    [r,c]=size(mt);
 for k=1:1:r
     mtt=[];
    mtt(1,:)=mt(k,:);
     mtt(mtt(1,:)==0)=[];
    
        for i=1:1:2
        if(grnode==mtt(1,i))
            mtt(1,i)=0;
        end
        
        end
        dlmwrite('netlistnew.txt',mtt,'-append','newline','pc');
    end
end 

imwrite(i7,sprintf('i8.jpg'));
%clc;
%clear all;
R=0;Cap=0;L1=0;V=0;
i7=imread('i8.jpg');


h9=im2bw(i7);
h9=bwmorph(h9,'clean');
CC9= bwconncomp(h9,8);
L9= labelmatrix(CC9);
RGB = label2rgb(L9);
stats=regionprops(CC9,'area');
idx00 = find([stats.Area] >5);
stats=regionprops(CC9,'BoundingBox');
for i=1:1:length(idx00)
    x=stats(idx00(i)).BoundingBox(1,1);
    y=stats(idx00(i)).BoundingBox(1,2);
    width=stats(idx00(i)).BoundingBox(1,3);
    height=stats(idx00(i)).BoundingBox(1,4);
     a=imcrop(h9,[x y width height]);
    a=imresize(a,[20 20],'bilinear');
     a = padarray(a,[4,4], 0, 'both');

      ce(:,:,i) =a;
    imwrite(ce(:,:,i),sprintf('%d.jpg',i));

end

train2=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\HOFVtrain.txt');
  fid2=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\trainlabelHOFV.txt','r');
  s1=fread(fid2);
  s1((s1==44))=[];
  s1((s1==10))=[];
  s1((s1==13))=[];
 Rtrain069=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Resistor\train 0 6 9\coodbinary.txt');
 Rlabel069ID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Resistor\train 0 6 9\numbers 0 6 9 K M.txt','r');
 Rlabel069=fread(Rlabel069ID);
 Rlabel069((Rlabel069==13))=[];
 Rlabel069((Rlabel069==10))=[];
 fclose(Rlabel069ID);
 Rtrain123457=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Resistor\TRAIN 1 2 3 4 5 7\coodbinary.txt');
 Rlabel123457ID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Resistor\TRAIN 1 2 3 4 5 7\numbers 1 2 3 4 5 7 K M.txt','r');
 Rlabel123457=fread(Rlabel123457ID);
 Rlabel123457((Rlabel123457==13))=[];
 Rlabel123457((Rlabel123457==10))=[];
 fclose(Rlabel123457ID);
 Rtrain8=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Resistor\TRAIN 8\coodbinary.txt');
 Rlabel8ID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Resistor\TRAIN 8\numbers 8 K M.txt','r');
 Rlabel8=fread(Rlabel8ID);
 Rlabel8((Rlabel8==13))=[];
 Rlabel8((Rlabel8==10))=[];
 fclose(Rlabel8ID); 
 
 Vtrain069=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Voltage\train 0 6 9\coodbinary.txt');
 Vlabel069ID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Voltage\train 0 6 9\numbers 0 6 9 m.txt','r');
 Vlabel069=fread(Vlabel069ID);
 Vlabel069((Vlabel069==13))=[];
 Vlabel069((Vlabel069==10))=[];
 fclose(Vlabel069ID);
 Vtrain123457=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Voltage\train 1 2 3 4 5 7\coodbinary.txt');
 Vlabel123457ID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Voltage\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7 m.txt','r');
 Vlabel123457=fread(Vlabel123457ID);
 Vlabel123457((Vlabel123457==13))=[];
 Vlabel123457((Vlabel123457==10))=[];
 fclose(Vlabel123457ID);
 Vtrain8=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Voltage\train 8\coodbinary.txt');
 Vlabel8ID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Voltage\train 8\numbers 8 m.txt','r');
 Vlabel8=fread(Vlabel8ID);
 Vlabel8((Vlabel8==13))=[];
 Vlabel8((Vlabel8==10))=[];
 fclose(Vlabel8ID); 
 
 
 
 Ctrain069=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 0 6 9\coodbinary11.txt');
 Clabel069=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 0 6 9\numbers 0 6 9.txt');
%  Clabel069ID=fopen('Inductor\train 0 6 9\numbers 0 6 9.txt','r');
%  Clabel069=fread(Clabel069ID);
%  fclose(Clabel069ID);
  Ctrain123457=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 1 2 3 4 5 7\coodbinary11.txt');
Clabel123457=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt');
  %  Clabel123457ID=fopen('Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt','r');
%  Clabel123457=fread(Clabel123457ID);
%  fclose(Clabel123457ID);
  %Ctrain8=csvread('Inductor\train 8\coodbinary.txt');
%  ClabelunID=fopen('Inductor\alphaun.txt','r');
 % Clabelun=fread(ClabelunID);
  %fclose(ClabelunID); 

Ctrainchar=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Capacitor\Abin11.txt');
 ClabelcharID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Capacitor\train 0 6 9\alphaun.txt','r');
 Clabelchar=fread(ClabelcharID);
 fclose(ClabelcharID); 
 
 Ltrain069=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 0 6 9\Abin11.txt');
 Llabel069=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 0 6 9\numbers 0 6 9.txt');
%  Llabel069ID=fopen('Inductor\train 0 6 9\numbers 0 6 9.txt','r');
%  Llabel069=fread(Llabel069ID);
%  fclose(Llabel069ID);
  Ltrain123457=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 1 2 3 4 5 7\Abin11.txt');
Llabel123457=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt');
  %  Llabel123457ID=fopen('Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt','r');
%  Llabel123457=fread(Llabel123457ID);
%  fclose(Llabel123457ID);
  %Ltrain8=csvread('Inductor\train 8\coodbinary.txt');
%  LlabelunID=fopen('Inductor\alphaun.txt','r');
 % Llabelun=fread(LlabelunID);
  %fclose(LlabelunID); 

Ltrainchar=csvread('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\Abin11.txt');
 LlabelcharID=fopen('C:\Users\kalki\Documents\MATLAB\testingforconference\Inductor\train 0 6 9\alpham.txt','r');
 Llabelchar=fread(LlabelcharID);
 fclose(LlabelcharID); 
 

%   for pp1=1:2:length(s1)-1
% a11(pp1)=s1(pp1);
%   end
%     a11(a11==0)=[];  
%     a22=char(a11);  
%     a38=a22(1:length(a22));
 cnet=csvread('netlistnew.txt');
[r c]=size(cnet);

for oo=1:1:r
az1=cnet(oo,:);
az=az1(1,3:length(az1));
az(az==0)=[];

    
    len=length(az);
    %numbers=(len-2);
    
    CCc=bwconncomp(h9);
 
   labelnumber=az(len);
  
  image2=ce(:,:,labelnumber); 
  %figure,imshow(image2);
    [C,S] = wavedec2(image2,1,'db2');
A= appcoef2(C,S,'db2',1);
vvz(1,:)=A(:);


   label=knnclassify(vvz,train2,char(s1))
   
   



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
for g=1:1:len-1
            image1=ce(:,:,az(g));
%             [C1,S1] = wavedec2(image1,1,'db2');
%              A1= appcoef2(C1,S1,'db2',1);
%              vv1(1,:)=A1(:);
              vk(1,:)=image1(:);
             sepa=bwconncomp(image1);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             g1=g1+1;
             if(euler==0)
               valuesR(g1)=knnclassify(vk,Rtrain069,Rlabel069);
             end
             if(euler==1)
             valuesR(g1)=knnclassify(vk,Rtrain123457,Rlabel123457);
             end
 
             if(euler<=-1)
             valuesR(g1)=knnclassify(vk,Rtrain8,Rlabel8);
             end
          dd=length(valuesR)-1;
          for i=1:1:dd
              if(valuesR(i)==75)
             valuesR(i)=49;
              end
          end
          
             
end
        

       fid2=fopen('creatingnetlist0.txt','a');
        if(length(valuesR)==3)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)));      
        end
           if(length(valuesR)==4)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)),char(valuesR(4)));    
           end
            if(length(valuesR)==2)
            fprintf(fid2,'\r\nR%d  %d %d %c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)));    
          end
               if(length(valuesR)==5)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c%c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)),char(valuesR(4)),char(valuesR(5)));    
               end
     if(length(valuesR)==1)
            fprintf(fid2,'\r\nR%d  %d %d %c',R,az1(1),az1(2),char(valuesR(1)));    
          end
    
    
    
    fclose(fid2);
end

if(label=='V')
        V=V+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
%Vvalues=len-3;       
  valuesV=0;   
  gV=0;
for g=1:1:len-1
            image2=ce(:,:,az(g));
%             [C1,S1] = wavedec2(image,1,'db2');
%              A1= appcoef2(C1,S1,'db2',1);
%              vv1(1,:)=A1(:);
vvV(1,:)=image2(:);
             sepa=bwconncomp(image2);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             gV=gV+1;
             
             if(euler==0)
               valuesV(gV)=knnclassify(vvV,Vtrain069,Vlabel069);
             end
             if(euler==1)
             valuesV(gV)=knnclassify(vvV,Vtrain123457,Vlabel123457);
             end
 
             if(euler<=-1)
             valuesV(gV)=knnclassify(vvV,Vtrain8,Vlabel8);
             end
             if(length(valuesV)~=1)
             dd1=length(valuesV)-1;
    for i=1:1:dd1
        if(valuesV(i)==109)
            valuesV(i)=48;
        end
    end
             end
             
             
end
        

       fid2=fopen('creatingnetlist0.txt','a');
        if(length(valuesV)==3)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)));      
        end
           if(length(valuesV)==4)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)),char(valuesV(4)));    
           end
            if(length(valuesV)==2)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)));    
          end
               if(length(valuesV)==5)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c%c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)),char(valuesV(4)),char(valuesV(5)));    
               end
    if(length(valuesV)==1)
            fprintf(fid2,'\r\nVCC%d  %d %d %c',V,az1(1),az1(2),char(valuesV(1)));   
               end
    
    
    
    fclose(fid2);
end


if(label=='H')
        L1=L1+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
% Cvalues=len-3;       
  valuesL=0;   
  g3=0;
  imagechar=ce(:,:,az(len-1));
   [Ca,Sa] = wavedec2(imagechar,1,'db2');
 Aa= appcoef2(Ca,Sa,'db2',1);
vva(1,:)=Aa(:);
unit=knnclassify(vva,Ltrainchar,Llabelchar);
  
for g=1:1:len-2
            imageL=im2bw(ce(:,:,az(g)));
            [C3,S3] = wavedec2(imageL,1,'db2');
             A33= appcoef2(C3,S3,'db2',1);
             vv33(1,:)=A33(:);
             sepa=bwconncomp(imageL);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             g3=g3+1;
             if(euler==0)
               valuesL(g3)=knnclassify(vv33,Ltrain069,Llabel069);
             end
             if(euler==1)
             valuesL(g3)=knnclassify(vv33,Ltrain123457,Llabel123457);
             end
 
             if(euler<=-1)
             %valuesL(g2)=knnclassify(vv3,Ltrain8,Llabel8);
             valuesL(g3)=8;
             end
             
             
             
         
end
        

       fid2=fopen('creatingnetlist0.txt','a');
        if(length(valuesL)==2)
            fprintf(fid2,'\r\nL%d  %d %d %d%d%c',L1,az1(1),az1(2),valuesL(1),valuesL(2),unit);      
        end
           if(length(valuesL)==3)
            fprintf(fid2,'\r\nL%d  %d %d %d%d%d%c',L1,az1(1),az1(2),valuesL(1),valuesL(2),valuesL(3),unit);    
           end
            if(length(valuesL)==1)
            fprintf(fid2,'\r\nL%d  %d %d %d%c',L1,az1(1),az1(2),valuesL(1),unit);    
            end
               if(length(valuesL)==4)
            fprintf(fid2,'\r\nL%d  %d %d %d%d%d%d%c',L1,az1(1),az1(2),valuesL(1),valuesL(2),valuesL(3),valuesL(4),unit);    
               end
    
    
    
    
    fclose(fid2);
end
    
if(label=='F')
        Cap=Cap+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
% Cvalues=len-3;       
  valuesC=0;   
  g2=0;
  imagechar=ce(:,:,az(len-1));
   [Ca,Sa] = wavedec2(imagechar,1,'db2');
 Aa= appcoef2(Ca,Sa,'db2',1);
vva(1,:)=Aa(:);
unit=knnclassify(vva,Ctrainchar,Clabelchar);
  
for g=1:1:len-2
            image=ce(:,:,az(g));
%             [C3,S3] = wavedec2(image,1,'db2');
%              A3= appcoef2(C3,S3,'db2',1);
             vv3(1,:)=image(:);
             sepa=bwconncomp(image);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             g2=g2+1;
             if(euler==0)
               valuesC(g2)=knnclassify(vv3,Ctrain069,Clabel069);
             end
             if(euler==1)
             valuesC(g2)=knnclassify(vv3,Ctrain123457,Clabel123457);
             end
 
             if(euler<=-1)
             %valuesC(g2)=knnclassify(vv3,Ctrain8,Clabel8);
             valuesC(g2)=8;
             end
             
             
             
         
end
        

       fid2=fopen('creatingnetlist0.txt','a');
        if(length(valuesC)==2)
            fprintf(fid2,'\r\nC%d  %d %d %d%d%c',Cap,az1(1),az1(2),valuesC(1),valuesC(2),unit);      
        end
           if(length(valuesC)==3)
            fprintf(fid2,'\r\nC%d  %d %d %d%d%d%c',Cap,az1(1),az1(2),valuesC(1),valuesC(2),valuesC(3),unit);    
           end
            if(length(valuesC)==1)
            fprintf(fid2,'\r\nC%d  %d %d %d%c',Cap,az1(1),az1(2),valuesC(1),unit);    
            end
               if(length(valuesC)==4)
            fprintf(fid2,'\r\nC%d  %d %d %d%d%d%d%c',Cap,az1(1),az1(2),valuesC(1),valuesC(2),valuesC(3),valuesC(4),unit);    
               end
    
    
    
    
    fclose(fid2);
    end


end
toc;