function J = convertToBW(I,thresh)
J = I ;
[x,y,z] = size(I) ;

for i=1:x
    for j=1:y
        if(I(i,j)<thresh)
            J(i,j)=0;
        else
            J(i,j)=255;
        end
    end
end
            
end