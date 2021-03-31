function [lam,Qbar]=UnshiftedQR(A,k) 
% Computes eigenvalues/vectors of symmetric matrix 
% Input: matrix A, number of steps k 
% Output: eigenvalues lam and eigenvector matrix Qbar 
    [m,n]=size(A); 
    Q=eye(m,m); 
    Qbar=Q; 
    R=A; 
    for j=1:k 
        [Q,R] = qr(R*Q); % QR factorization
        Qbar=Qbar*Q;     % accumulate Q's
    end
    lam=diag(R*Q);       % diagonal converges to eigenvalues
end
     
    