t = -2:0.001:8;

u = @(t) t > 0; 

f = @(t) -1 + 4 * t + 5 * exp(-t);

%fe = @(t) (f(t) + f(-t)) / 2;
%fo = @(t) (f(t) - f(-t)) / 2;

grid on
%plot(t, fo(t));
%plot(t, fe(t));
plot(t, f(t));
hold off