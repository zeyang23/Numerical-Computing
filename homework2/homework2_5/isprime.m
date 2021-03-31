function x = isprime(n)
    x=1;
    if(n==1)
        x=0;
    elseif(n==2)
        x=1;
    else
        for i=2:fix(n^0.5)
            if(mod(n,i)==0)
                x=0;
                break;
            end
        end
    end
end