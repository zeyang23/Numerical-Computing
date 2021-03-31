clear
clc

f=@(t,y) [y(2);2*exp(-2*y(1)).*(1-t.^2)];
tspan=[0,1];

% ±ﬂΩÁ÷µ
y_start=0;
y_end=log(2);

h=0.01;

s0=-6;
s=fsolve(@F,s0);

[t,y]=RK4(f,tspan,[y_start;s],h);
plot(t,y(1,:));
% hold on 
% plot(t,y(2,:));
% legend('y1','y2')

function r=F(s)
    f=@(t,y) [y(2);2*exp(-2*y(1)).*(1-t.^2)];
    tspan=[0,1];
    y_start=0;
    y_end=log(2);
    h=0.01;
    
    y0=[y_start;s];
    [~,y]=RK4(f,tspan,y0,h);
    r=y(1,end)-y_end;    
end