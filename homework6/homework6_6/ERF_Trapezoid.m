function I=ERF_Trapezoid(x)
    f = @(t) 2./sqrt(pi).*exp(-t.^2);

    lb = 0;
    ub = x;

    TOL = 1e-8;

    [I,~] = Adaptive_Quadrature_Trap(f,lb,ub,TOL);
end