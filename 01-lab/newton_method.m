function [xm, ym] = newton_method(f, x0)
    precision = 10^(-4); % Method precision (when to stop)
    
    syms x;
    f_sym = f(x);

    f_d1 = matlabFunction(diff(f_sym, x)); % first order derivative of the function
    f_d2 = matlabFunction(diff(f_d1, x)); % second order derivative of the function
    
    prev = x0;
    next = prev - f_d1(prev) / f_d2(prev);
    while abs(prev - next) > precision
        prev = next;
        next = prev - f_d1(prev) / f_d2(prev);
    end
    
    xm = next;
    ym = f(xm);
end