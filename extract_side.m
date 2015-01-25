function [angle_deg,val] = extract_side(I,x,y)
[y1,x1] = size(I(:,:,3));


x1 = x1/2 ;
y1 = y1/2 ; 
%x1
%y1
y2 = y1-y ; 
x2 = x-x1 ;
y2 = double(y2);
x2 = double(x2);
angle_rad = atan(y2/x2);
%angle_rad = atan2(y2,x2);
% or angle_deg = atand(y2/x2) ; direct result
angle_deg = (angle_rad*180)/pi;
if(x>x1)
    angle_deg = abs(angle_deg);
end
if(x>x1)
    val = 1;
else  
    val = -1; 
end
end