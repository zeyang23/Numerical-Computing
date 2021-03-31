file=fopen('table.txt','w');
for i=1:9
    for j=1:i
    fprintf(file,"%d*%d=%2d ",j,i,j*i); 
    end
    fprintf(file,"\n");
end
fclose(file);
