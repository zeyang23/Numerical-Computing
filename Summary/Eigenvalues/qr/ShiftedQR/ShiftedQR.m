function lam = ShiftedQR(A)
    tol=1e-14; kounttol=500; m=size(A,1); lam=zeros(m,1);n=m;
    while n>1
        kount=0;
        while max(abs(A(n,1:n-1)))>tol & kount<kounttol
            kount=kount+1;
            mu=A(n,n);
            [q,r]=qr(A-mu*eye(n)); 
            A=r*q+mu*eye(n);
        end
        if kount<kounttol
            lam(n)=A(n,n);
            n=n-1; A=A(1:n,1:n);
        else
            disc=(A(n-1,n-1)-A(n,n))^2+4*A(n,n-1)*A(n-1,n);
            lam(n)=(A(n-1,n-1)+A(n,n)+sqrt(disc))/2;
            lam(n-1)=(A(n-1,n-1)+A(n,n)-sqrt(disc))/2;
            n=n-2; A=A(1:n,1:n);
        end
    end
    if n>0
        lam(1)=A(1,1); 
    end
end