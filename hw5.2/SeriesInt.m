function area = SeriesInt(N, times, vals, i0, i1, w0, fun)
    dTau = abs(times(i1) - times(i0));
    a = vals(i0);
    b = vals(i1);
    area = (a * fun(N*w0*(times(i0))) + b * fun(N*w0*(times(i1)))) * dTau / 2;
    %fprintf("a = %f, b = %f, dTau = %f, w0 = %f, area = %f\n", a, b, dTau, w0, area);
end
