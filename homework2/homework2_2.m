n=input("input a number\n");
counter=0;
while(1)
    if(mod(n,2)==0)
        n=n/2;
    elseif(mod(n,2)==1)
        n=n*3+1;
    end
    counter=counter+1;
    if(n==1)
        break;
    end
end
fprintf('counter = %d\n',counter)
       
    
    