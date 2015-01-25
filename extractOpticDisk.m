function [J,diam] = extractOpticDisk(I)
%I = imread(path) ;
K = I ;
[x,y,z] = size(I) ;
%figure, imshow(I) ;
% for i=1:x
%     for j=1:y
%             if(I(i,j,1)<200 || (I(i,j,1)>240 && I(i,j,2)>240 && I(i,j,3)>240))  %yellow region
%                         I(i,j,1)=0  ;
%                         I(i,j,2)= 0 ;
%                         I(i,j,3) = 0 ;
%             end
%     end
% end
% figure , imshow(I) ;   
% returned image- BW superimpose mask on original image
% for i=1:x
%     for j=1:y
%         if(J(i,j)==0)
%             I(i,j,1)=0;
%             I(i,j,2)=0 ; 
%             I(i,j,3)=0;
%         end
%     end
% end
% figure, imshow(I);
%find out left most point of optic disk
% x
% y
% for j=1:y
%     for i=1:x
%         if(I(i,j,1)>=200)
%             left = j ; 
%             break  ;
%         end
%     end
% end
% %right most point of optic disk
% 
% for j=y:-1:1
%     for i=1:x
%         if(I(i,j,1)>=200)
%             right=j; 
%             height = i ;
%             break ;
%         end
%     end
% end
% left
% right
% height
% 
% diam = right-left ;
% if(diam<0)
%     diam = diam*-1 ;
% end
% midpoint = (left+right)/2 ;
% midpoint
% 
% length = diam*3 ; 
% topx = midpoint-length/2 ; 
% if(topx<0)
%     topx = 0 ;
% end
% topy = height-length/2 ;
% if(topy<0)
%     topy= 0 ;
% end
% bottx = topx+ length ;
% botty = topy+length ;
% % doesnt seem to work when the optic disk is at the lower left of the
% % picture - write another function to determine which quadrant to consider 
% %J = imcrop(K,[topx,topy,botty,bottx]) ;
% figure , imshow(J);

J = extractOpticDisk2(I);
figure, imshow(J);
[x,y,z]=size(J);
[diam,xCentre,yCentre] = extractDiamOfOpticDisk(J,x,y);
[topx,topy,width,height] = retCoordForCrop1(x,y,xCentre,yCentre,diam);
if(topx==-1)
   J = K;
else
   J = imcrop(K,[topx,topy,width,height]) ;
end
%J=K;
figure, imshow(J);
end