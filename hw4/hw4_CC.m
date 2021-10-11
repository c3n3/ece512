function hw4_CC(inputFile, filtType, fc)
    res = fopen(inputFile);
    
    C = textscan(res, "%f %f", 'Delimiter', '\n');
    times = C(1,1);
    times = times{1};
    x = C(1,2);
    x = x{1};
    dTau = times(2) - times(1);
    RC = 1 / (2 * pi * fc);
    h = 0;
    if (filtType == 0)
    % HLP
        hfun = @(t) (1 / (RC^2)) * t .* exp(-t / RC);
        h = hfun(0:dTau:10*dTau);
    else
        hfun = @(t) 1/dTau + ((-2 / (RC)) * (1 / (RC^2)) * t) .* exp(-t / RC);
        h = hfun(0:dTau:10*dTau);
    end
    h
    y = physConv_CC(x,h,dTau);
    
    t = 0:dTau:(length(y) - 1)*dTau;
    figure()
    grid on
    plot(t,y')
end

