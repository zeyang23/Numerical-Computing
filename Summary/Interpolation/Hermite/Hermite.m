function v=Hermite(x,y,dy,u)
    n=length(x);
    delta_x=diff(x);
    P=zeros(n-1,4);
    for k=1:n-1
        A=zeros(4,4);
        A(1,:)=poly([x(k+1),x(k+1),-1/2*delta_x(k)+x(k)]).*(2./(delta_x(k).^3))*y(k);
        A(2,:)=poly([x(k),x(k),1/2*delta_x(k)+x(k+1)]).*(-2./(delta_x(k).^3))*y(k+1);
        A(3,:)=poly([x(k+1),x(k+1),x(k)]).*(1./(delta_x(k).^2)*dy(k));
        A(4,:)=poly([x(k),x(k),x(k+1)]).*(1./(delta_x(k).^2)*dy(k+1));
        P(k,:)=sum(A);
    end
    
    % 根据u计算v 利用了数组的逻辑索引法
    S=transpose(P);
    a=S(4,:);
    b=S(3,:);
    c=S(2,:);
    d=S(1,:);
    x=x(2:end-1);
    
    K=ones(size(u));
    for i=1:length(x)
        K(x(i)<=u)=i+1;
    end
    v=a(K)+u.*(b(K)+u.*(c(K)+u.*d(K)));
end