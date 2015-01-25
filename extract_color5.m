function [K1,r,g,b] = extract_color5(I,angle,val)
angle_check = (5*90/6);
if(val==1 && angle<angle_check)
    SE=strel('line',20,0);
    threshold_intensity = 20 ; %55
    sumThresh = 60;
else
    SE=strel('line',9,0);
    threshold_intensity = 10 ; %33
    sumThresh = 30;
end
         
%J = imbothat(I,SE);
JcontrastEnhanced = imsubtract(imadd(I,imtophat(I,SE)),imbothat(I,SE));
imshow(JcontrastEnhanced);
J = imbothat(JcontrastEnhanced, SE);
imshow(J);

K1=I;
K2 = I;
[dimx, dimy,z] = size(I) ; 
sum_red = 0;
sum_green = 0;
sum_blue = 0;


for i = 1:dimx
   for j=1:dimy
      sum_red = sum_red + J(i,j,1);
      sum_green = sum_green + J(i,j,2);
      sum_blue = sum_blue +J(i,j,3);
   end
end
num = dimx*dimy;
mean_red = sum_red/num;
mean_green = sum_green/num;
mean_blue=sum_blue/num;
 
for i = 1:dimx
   for j=1:dimy
      if(J(i,j,1) + J(i,j,2) + J(i,j,3) < sumThresh)
          K2(i,j,1)=0  ;
          K2(i,j,2)= 0 ;
          K2(i,j,3) = 0 ;
      else
          K2(i,j,1) = I(i,j,1) ;
          K2(i,j,2) = I(i,j,2) ;
          K2(i,j,3) = I(i,j,3) ;
      end
   end
end
%figure, imshow(K2);

K3 = I;
for i=1:dimx
   for j=1:dimy
        if ((255- J(i,j,1) +  255 - J(i,j,2) + 255 - J(i,j,3)) < ((0.75 * mean_red) + (0.75 * mean_green)+ (0.75 * mean_blue)))
                       K3(i,j,1)=0  ;
                       K3(i,j,2)= 0 ;
                       K3(i,j,3) = 0 ;
               
        else
             K3(i,j,1) = I(i,j,1) ;
             K3(i,j,2) = I(i,j,2) ;
             K3(i,j,3) = I(i,j,3) ;
        end
    end
end
%figure, imshow(K3);
% superimpose original image on mask obtained to get veins only.
for i=1:dimx
   for j=1:dimy
        if (J(i,j,1)<threshold_intensity)
            if(J(i,j,2)<threshold_intensity)
                if(J(i,j,3)<threshold_intensity)
                       K1(i,j,1)=0  ;
                       K1(i,j,2)= 0 ;
                       K1(i,j,3) = 0 ;
                end
            end
        else
             K1(i,j,1) = I(i,j,1) ;
             K1(i,j,2) = I(i,j,2) ;
            K1(i,j,3) = I(i,j,3) ;
        end
    end
end
%figure, imshow(K1);
%[r,g,b] = calc_average(K1,threshold_intensity);
[r,g,b] = calc_average(K1,threshold_intensity);
%r
%g
%b
end
