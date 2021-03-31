tic,A=rand(500);
B=inv(A);
e=norm(A*B-eye(500)),toc