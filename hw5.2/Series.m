function [an, bn] = Series(times, vals, N, w0)
    an = 0;
    bn = 0;
    for i = 1:size(times) - 1
        cosine = @(t) cos(t);
        sine = @(t) sin(t);
        an = an + SeriesInt(N, times, vals, i, i+1, w0, cosine);
        bn = bn + SeriesInt(N, times, vals, i, i+1, w0, sine);
    end
end

