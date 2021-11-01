function area = SeriesInt(N, times, vals, i0, i1, w0, fun)
    dTau = times(i1) - times(i0);
    a = vals(i0);
    b = vals(i1);
    area = (a + b) * dTau * fun(N*w0*(times(i0) + dTau)) / 2;
end
