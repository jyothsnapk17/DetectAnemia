function [res,hTable,firstName,isNew] = write_rgb(pic_name,r,g,b,file_name,names,pID) 
%error message 
error = 'Cannot open specified for writing.' ;

% if(~isset(names))
%     names = java.util.Hashtable;
% end

%char(names.toString)
if(strcmpi(char(names.toString),'{}')==1)
    fd = fopen(file_name,'w') ;
    1
else
    fd = fopen(file_name,'a');
    2
end

if(fd==-1)
    disp error ;
    res = -1 ;
    return ;
end

%tokenise name for haemoglobin value
%get first name
[firstName,remain] = strtok(pic_name,'_') ;
remain1= remain ;

%retrieve hb value
while true 
    [Hb,remain] = strtok(remain,'-') ;
    if(isempty(remain))
        if(strcmpi(Hb,remain1)==1)
            Hb=-1 ;
            break;
        end
        %Hb contains string with Hb value
        Hb = strtok(Hb,'Grms') ;
        Hb = strtrim(Hb);
        Hb = str2num(Hb);
        break;
    end
end
isNew = 0 ; 


if(names.containsKey(java.lang.String(firstName))) %name is present in the hashtable
    isNew = 0 ;
    Hb = names.get(java.lang.String(firstName)) ;
    fprintf(fd,'%d,%.2f,%.2f,%.2f,%.2f\n',pID,r,g,b,Hb);
elseif(Hb~=-1) %save value into Hashtable
    isNew = 1 ;
    pID = pID+1 ;
    names.put(java.lang.String(firstName), java.lang.Float(Hb));
    fprintf(fd,'%d,%.2f,%.2f,%.2f,%.2f\n',pID,r,g,b,Hb);
end
Hb
     
% % while true
% %    [str, remain] = strtok(remain, '-');
% %    if isempty(remain)
% %        [str,remain] = strtok(str,'%');
% %        ans = strcmpi(pic_name,str);
% %        if(ans==false)
% %            str = strcat(str,' %');
% %            if(counter==1)
% %                fprintf(fd,'%s',str);
% %            else
% %                fprintf(fd,'\n%s',str) ;
% %            end
% %        end
% %        break ;
% %    endf
% % end
% % 
% % %write to file
% % fprintf(fd,'\n%d - %.2f,%.2f,%.2f',counter,r,g,b);
res = 1; 
hTable = names ;
fclose(fd);
end