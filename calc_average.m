function [avg_red,avg_green,avg_blue] = calc_average(I,threshold_intensity)
[dimx, dimy,z] = size(I) ; 
avg_red = uint32(0) ;
avg_blue = uint32(0) ;
avg_green = uint32(0) ;
count = uint32(0) ;
for i=1:dimx
   for j=1:dimy
       if(I(i,j,1)>threshold_intensity)
           if(I(i,j,2)>threshold_intensity)
               if(I(i,j,3)>threshold_intensity)
                   count = count + 1 ;
                   %I(i,j,1)
                   %I(i,j,2)
                   %I(i,j,3)
                   avg_red = avg_red + uint32(I(i,j,1));
                   avg_blue = avg_blue + uint32(I(i,j,2));
                   avg_green = avg_green + uint32(I(i,j,3));
               end
           end
       end
   end
end
avg_red = avg_red/count ; 
avg_blue = avg_blue/count ;
avg_green = avg_green/count ; 

%imshow(I);

end
