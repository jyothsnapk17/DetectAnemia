function [res,hTable,fileStruct,coeff,patients] = anemiaFinal(dPath)
%choose between final() and final1()
[res,hTable,fileStruct,fname,patients] = final1(dPath) ;
fname_mean = computeMean(fname);
coeff = linearRegression(fname_mean);
end