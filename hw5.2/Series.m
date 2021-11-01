function [an, bn] = Series(times, vals, N, w0)
    an = 0;
    bn = 0;
    T0 = 2 * pi / w0;
%     ay = vals .* cos(N*w0*times);
%     by = vals .* sin(N*w0*times);
%     an = trapz(times, ay) * (w0 / pi);
%     bn = trapz(times, by) * (w0 / pi);
%     fprintf("an = %.8f bn = %.8f\n", an, bn);
    startTime = times(1);
    fprintf("Start time = %f, T0 = %f\n", startTime, T0);
    for i = 1:length(times) - 1
        if (times(i) - startTime > T0)
            fprintf("stopping at t = %f\n", times(i));
           break
        end
        cosine = @(t) cos(t);
        sine = @(t) sin(t);
        an = an + SeriesInt(N, times, vals, i, i+1, w0, cosine);
        bn = bn + SeriesInt(N, times, vals, i, i+1, w0, sine);
    end
    an = an * 2 / T0;
    bn = bn * 2 / T0;
end

