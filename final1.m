function [succ,hTable,files,file_name,patients] = final1(dpath)
cur_dir = pwd ;
succ = 1 ; 

% path = prefix to add for the absolute path name 
% path ='C:\Documents and Settings\admin\Desktop\MATLAB\OOMD\PHOTOS\' ;

%Hashtable to store names and corresponding Hb values
hTable = java.util.Hashtable;

%list of files in directory
prompt = 'enter path to photos folder : ' ; 
photoPath = input(prompt,'s'); 
if(strcmp(photoPath,'')==1)
    disp('default') ;
    files = rdir('C:\Documents and Settings\admin\Desktop\MATLAB\OOMD\PHOTOS\**\*.jpg');
else
    disp('chosen'); 
    files = rdir(strcat(photoPath,'\**\*.jpg')) ; 
end
disp(size(files)) ; 

%desktop path 
%dpath = 'C:\Documents and Settings\admin\Desktop\' ;

%file name - prompt user
user_prompt = 'Enter destination file : ' ;
fname = input(user_prompt,'s') ;
disp(fname) ;

ans = strcmp(fname,'') ;
if(ans==1)
file_name = 'C:\Documents and Settings\admin\Desktop\sample_center.txt' ;
else
    file_name = strcat(dpath,fname,'.txt') ;
end

[rows,columns] = size(files) ;
rows

patientID = 0 ; 
patients = '' ; 
for i=1:rows
    files(i).name
%     a = input('enter any key to continue ::: ' , 's');
    [K,r,g,b] = extract_color_final1(files(i).name);
    close all ;
    if(r==-1)
        succ = -1 ;
        return;
    end
    
    %write r,g,b for patient to file ( name - remove path from file )
    remain = files(i).name ;
    while (~isempty(findstr(remain,'\')))
        [beg,remain] = strtok(remain,'\') ;
    end
    beg
    char(hTable.toString)
    %write r,g,b for patient to file
    [r,hTable,firstName,isNew] = write_rgb(beg,r,g,b,file_name,hTable,patientID) ;
    if(isNew==1)
        patientID = patientID +1 ;
        patients{patientID} = firstName ;
    end
end
patientID 
close all ;
end