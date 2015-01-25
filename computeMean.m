function fname1= computeMean(fname)
inputMatrix = dlmRead(fname,',');
[rows,columns] = size(inputMatrix) ;
noVal = 0;
prev=1;
rMean =0;
bMean = 0;
gMean = 0;
Hb =0;
fname1 = 'C:\Documents and Settings\admin\Desktop\meanData3.txt' ;
 fd = fopen(fname1,'w');
for i=1:rows
    if(inputMatrix(i,1)~=prev)
            rMean = rMean/noVal;
            gMean = gMean/noVal;
            bMean = bMean/noVal;
            fprintf(fd,'%.2f,%.2f,%.2f,%.2f\n',rMean,gMean,bMean,Hb);
            %writeTofile(rMean,gMean,bMean,Hb);
            prev = inputMatrix(i,1);
            noVal = 1;
            rMean = 0;
            gMean = 0;
            bMean = 0;
            
    end
        rMean = rMean + inputMatrix(i,2);
        gMean = gMean + inputMatrix(i,3);
        bMean = bMean + inputMatrix(i,4);
        noVal = noVal+1;
        Hb = inputMatrix(i,5);
    
end
 rMean = rMean/noVal;
 gMean = gMean/noVal;
 bMean = bMean/noVal;
 fprintf(fd,'%.2f,%.2f,%.2f,%.2f\n',rMean,gMean,bMean,Hb);
fclose(fd);
end