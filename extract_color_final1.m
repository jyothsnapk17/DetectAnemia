function [K,r,g,b] = extract_color_final1(path)
I = imread(path);
I = removeDate(I) ;
[I,diam] = extractOpticDisk(I);
figure , imshow(I);
if(diam==-1)
    K = I ;
end
%close all;
%figure, imshow(I);
[x,y,z] = size(I) ;
K=I ;
% for i=1:x
%     for j=1:y
%             if(K(i,j,1)<200)
%                         K(i,j,1)=0  ;
%                         K(i,j,2)= 0 ;
%                         K(i,j,3) = 0 ;
%             end
%     end
% end
% figure , imshow(K) ;   
% %find out left most point of optic disk of cropped image
% %x
% %y
% for j=1:y
%     for i=1:x
%         if(K(i,j,1)>=200)
%             left = j ; 
%             break  ;
%         end
%     end
% end
% %right most point of optic disk
% 
% for j=y:-1:1
%     for i=1:x
%         if(K(i,j,1)>=200)
%             right=j; 
%             height = i ;
%             break ;
%         end
%     end
% end
J = extractOpticDisk1(I);
[x,y,z]=size(I);
[diam,xCentre,yCentre] = extractDiamOfOpticDisk(J,x,y);
midpoint = xCentre ;
height = yCentre ;

[angle,val] = extract_side(I,height,midpoint) ;
%method 1- bottom hat transformation
[K,r,g,b] = extract_color5(I,angle,val) ;
imshow(K);
        
end
    