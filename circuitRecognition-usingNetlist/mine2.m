for i=1:1:length(lines)
 A=lines(i).point1;
 B=lines(i).point2;
 if A(2)==B(2)
     for x=A(1):1:B(1)
         a2(x,B(2))=0;
          a2(x,B(2)+1)=0;
          a2(x,B(2)-1)=0;
          a2(x-1,B(2))=0;
          a2(x,B(2)-1)=0;
          a2(x-1,B(2)-1)=0;
          a2(x+1,B(2)+1)=0;
          a2(x-1,B(2)+1)=0;
          a2(x+1,B(2)-1)=0;
          a2(x,B(2)+2)=0;
          a2(x,B(2)-2)=0;
          a2(x-2,B(2))=0;
          a2(x,B(2)-2)=0;
          a2(x-2,B(2)-2)=0;
          a2(x+2,B(2)+2)=0;
          a2(x-2,B(2)+2)=0;
          a2(x+2,B(2)-2)=0;
     end
 else if A(1)==B(1)
      for x=A(2):1:B(2)
         a2(B(1),x)=0;
         a2(B(1)+1,x)=0;
          a2(B(1)-1,x)=0;
          a2(B(1),x-1)=0;
          a2(B(1)-1,x)=0;
          a2(B(1)-1,x-1)=0;
          a2(B(1)+1,x+1)=0;
          a2(B(1)+1,x-1)=0;
          a2(B(1)-1,x+1)=0;
          a2(B(1)+2,x)=0;
          a2(B(2)-2,x)=0;
          a2(B(1),x-2)=0;
          a2(B(1)-2,x)=0;
          a2(B(1)-2,x-2)=0;
          a2(B(1)+2,x+2)=0;
          a2(B(1)+2,x-2)=0;
          a2(B(1)-2,x+2)=0;
      end  
     end
 end
end
