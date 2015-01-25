function [topx,topy,width,height] = retCoordForCrop1(x,y,xCentDisk,yCentDisk,diamDisk)
%[x,y,z] = size(K);

%find which quadrant the optic disk is in : divide the canvas into 4
%vertical lines and 4 horizontal lines - 
% this creating 16 regions - depending on the coordinates - include those
% regions as necessary - 
% store x and y in cell array

% or simpler approach - divide the image into 3 vertical planes . compare
% position of x coordinate between the divisions and select the part to
% crop
x
y
regionLeft = 1 ;
regionRight = 4 ;
n=4;
regions(1)= 1 ;
regions(2) = regions(1) + y/3 ;
regions(3) = regions(2) + y/3 ;
regions(4) = y ;
regionWidth = y/3;

str = sprintf('region 1 : %d to %d......region 2 : %d to %d............region3 : %d to %d ',regions(1),regions(2),regions(2),regions(3),regions(3),regions(4));
    disp(str);
rightY = xCentDisk + diamDisk/2 ;
leftY = xCentDisk - diamDisk/2 ;

 str = sprintf('leftX :%d--------rightX : %d',leftY,rightY);
    disp(str);
%check which region left point belongs to
for i=1:n-1
    if(leftY >= regions(i) && leftY < regions(i+1))
        regionLeft = i ;
        str = sprintf('Compared and set leftX to region : %d',i);
        disp(str);
        break ;
    end
end
 
%check which regions rightX belongs to 
for i=1:n-1
    if(rightY >= regions(i) && rightY < regions(i+1))
        regionRight = i ;
        str = sprintf('Compared and set rightX to region : %d',i);
        disp(str);
        break ;
    end
end

str = sprintf('left in region : %d--------right in region : %d',regionLeft,regionRight);
disp(str);

if(regionLeft==regionRight)
    str = sprintf('In region : %d',regionLeft);
    disp(str);
    topx = regions(regionLeft) ;
    topy = 1;
    bottx = regions(regionLeft+1) ;
    botty = x ;
elseif(regionRight==regionLeft+1)
    topx = xCentDisk - regionWidth/2 ; 
 %   topx = regions(regionLeft) + (regions(regionLeft) + regions(regionRight))/2 ;
    topy= 1 ;
    bottx = xCentDisk + regionWidth/2 ;
 %  bottx = regions(regionRight) + (regions(regionLeft) + regions(regionRight))/2 
    botty = x;
    str = sprintf('left in region : %d--------right in region : %d',regionLeft,regionRight);
    disp(str);
else
    %default case - include full image
    topx = -1;
    bottx = -1 ;
    topy = -1 ;
    botty = -1 ;
    str = sprintf('Default, take full image');
end

topx
bottx
topy
botty
height = botty - topy ; 
width = bottx - topx;
width 
height
end