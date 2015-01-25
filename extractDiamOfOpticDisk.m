function [diam,xCentre,yCentre] = extractDiamOfOpticDisk(I,x,y)
%imshow(I);
%[x,y,z] = size(I);

%find out right most point of optic disk
right = 1;
for j=1:y
    for i=1:x
        if(I(i,j)>0)
            right = j ; 
            break  ;
        end
    end
end

%left most point of optic disk
left = y;
for j=y:-1:1
    for i=1:x
        if(I(i,j)>0)
            left=j; 
            height = i ;
            break ;
        end
    end
end
left
right

diam = right-left ;
if(diam<0)
    diam = diam*-1 ;
end    

%find top most point of optic disk
top = x ;
for i=x:-1:1
    for j=1:y
        if(I(i,j)>0)
            top = i ;
            break ;
        end
    end
end
top

%find bottom most point of optic disk
bottom=1;
for i=1:x 
    for j=1:y
        if(I(i,j)>0)
            bottom=i;
            break ;
        end
    end
end
bottom


%centre of extracted optic disk
totalx = int16(left+right) ;
xCentre = idivide(totalx,2,'floor') ;
xCentre

totaly = int16(top+bottom) ;
yCentre = idivide(totaly,2,'floor') ;
yCentre 
end