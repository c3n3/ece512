function [an, bn] = Series(times, vals, N, w0)
    an = 0;
    bn = 0;
    ay = vals .* cos(N*w0*times);
    by = vals .* sin(N*w0*times);
    an = trapz(times, ay) * (w0 / pi);
    bn = trapz(times, by) * (w0 / pi);
    fprintf("an = %.8f bn = %.8f\n", an, bn);
%     for i = 1:size(times) - 1
%         cosine = @(t) cos(t);
%         sine = @(t) sin(t);
%         an = an + SeriesInt(N, times, vals, i, i+1, w0, cosine);
%         bn = bn + SeriesInt(N, times, vals, i, i+1, w0, sine);
%     end
end

