function I = removeDate(I) 
[x,y,z] = size(I) ;
x
y
for i=1:x/10
    for j=1:y/10
        I(i,j,1)= 0;
        I(i,j,2)=0 ;
        I(i,j,3)=0 ;
    end
end
imshow(I);
end
