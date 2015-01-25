function J = extractOpticDisk2(I)
%replacement for extractOpticDisk1 - removal of noise
close all;

redChannel=I;
greenChannel=I;

%red channel - disk
redChannel(:,:,2:3)=0;

%green channel - cup
greenChannel(:,:,1)=0;
greenChannel(:,:,3)=0;

% figure, imshow(redChannel);

rcGray = rgb2gray(redChannel) ;
% figure, imshow(rcGray);

% figure, imshow(greenChannel);

gcGray = rgb2gray(greenChannel);
%consider green channel for cup
%consider red channel for disc
SE = strel('disk',10); 
gcGrayClose = imclose(gcGray,SE) ; %K-green
gcGrayCloseOpen = imopen(gcGrayClose,SE);
% figure , imshow(gcGrayCloseOpen);

rcGrayClose = imclose(rcGray,SE) ; %j -red
rcGrayCloseOpen = imopen(rcGrayClose,SE);
% figure , imshow(rcGrayCloseOpen);

%convert to binary image 
%automate threshold values to be passed to the function
gcBin = convertToBW(gcGrayCloseOpen,80) ;
figure,  imshow(gcBin) ;

rcBin = convertToBW(rcGrayCloseOpen,70) ;
figure , imshow(rcBin);

%extract veins
%[veinsImage,r,g,b] = extract_color_final1(path) ;

%extract diameter of cup and disk
[x,y,z]=size(gcBin);
[diamCup,xCentreCup,yCentreCup] = extractDiamOfOpticDisk(gcBin,x,y) ;
xCentreCup
yCentreCup
%create a mask of 500X500 around the centre of the cup
startMaskX = xCentreCup- 250 ;
startMaskY = yCentreCup - 250 ; 
endMaskX = xCentreCup + 250 ; 
endMaskY = yCentreCup + 250 ;

if(startMaskX<1)
    startMaskX=1 ; 
end
if(endMaskX>y)
    endMaskX=y ; 
end
if(startMaskY<1)
    startMaskY=1 ; 
end
if(endMaskY>x)
    endMaskY=x ; 
end
startMaskX
endMaskX
startMaskY
endMaskY

for i=1:x%chnged to j from i
    for j=1:y
        if(j>=startMaskX && j<=endMaskX && i>=startMaskY && i<=endMaskY)
           continue ;
        else
            rcBin(i,j)=0;
        end
    end
end

figure , imshow(rcBin) ;            
[x,y,z]=size(rcBin);
% [diamDisk,xCentreDisk,yCentreDisk] = extractDiamOfOpticDisk(rcBin,x,y) ;
J = rcBin ;
end
