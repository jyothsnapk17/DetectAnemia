function betahat = linearRegression(fname)
inputMatrix = dlmread(fname,',') ;
X1 = [ones(size(inputMatrix,1),1) inputMatrix(:,1:3)];
y = inputMatrix(:,4);
betahat = regress(y,X1);
betahat
end