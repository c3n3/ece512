t = -8:0.001:8;

u = @(t) t > 0; 

f = @(t) (2 * exp(t*log(2)/2).*(u(t - 1) - u(t - 2)) - 4 * (t - 3) .* (u(t - 2) - u(t - 4) ));

fe = @(t) (f(t) + f(-t)) / 2;
fo = @(t) (f(t) - f(-t)) / 2;

hold on
grid on
plot(t, fo(t));
plot(t, fe(t));
plot(t, f(t));

legend("fo(t)", "fe(t)", "f(t)");
hold off