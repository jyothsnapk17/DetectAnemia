function rcBin = extractOpticDisk1(I)

% %remove date timestamp from picture - top left corner
% [x,y,z] = size(I) ;
% for i=1:x/10
%     for j=1:y/10
%         %range of white
%         if(I(i,j,1)>=240 && I(i,j,2)>=240 && I(i,j,3)>=240)
%             I(i,j,1)=0;
%             I(i,j,2)=0;
%             I(i,j,3)=0;
%         end
%     end
% end
% %figure, imshow(I);

%red channel - disk
redChannel = I ;
redChannel(:,:,2:3)=0;

%figure, imshow(redChannel);

rcGray = rgb2gray(redChannel) ;
%figure, imshow(rcGray);

SE = strel('disk',10); 
rcGrayClose = imclose(rcGray,SE) ; %j -red
rcGrayCloseOpen = imopen(rcGrayClose,SE);
%figure , imshow(rcGrayCloseOpen);

rcBin = convertToBW(rcGrayCloseOpen,70) ;
%figure , imshow(rcBin);
end
