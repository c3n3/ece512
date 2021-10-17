

N = 15;

max = 12;
min = -max;
inc = 0.01;
a0 = 0.5;





f = @(t) (t > -1 & t < 1) + (t >= 1 & t < 2) * (-t + 2) + (t > -2 & t <= -1) * (t + 2);
center = 0;
period = 6;

w0 = 2*pi / period;
t = min:inc:max;

thetaN = @(n) 0 * n;
coeffeciant = @(n) ((-6 ./(n.^2.*pi^2)).*cos(2.*pi.*n./3) + (6 ./(n.^2.*pi^2)).*cos(pi.*n./3));
soid = @(t,n) cos(n*w0*t + thetaN(n));
term = @(t,n) coeffeciant(n) .* soid(t,n);


result = zeros(length(t),1);
for i = t
    index = round(i / inc - min / inc) + 1;
    for n = 1:N
        result(index) = result(index) + term(i,n);
    end
end

func = zeros(round((center - min + max - center)),1);
funcTimes = zeros(length(func),1);
point = findStartPoint(min, center, period);
for i = 0:round((center - min + max - center) / period)
    for time = point - period/2 : inc : point + period / 2
        index = round(i * period / inc + (time - (point - period/2)) / inc) + 1;
        funcTimes(index) = time;
        func(index) = f(time - point);
    end
    point = point + period;
end
result = result + a0;

% Actual function
figure()
grid on
hold on
plot(t, result);
plot(funcTimes, func);
hold off


Cn = coeffeciant(1:N);
On = thetaN(1:N);

% Phase plot, amplitude plot
figure()
grid on
stem(1:N, Cn);
legend("Cn");
title("Amplitude plot");

figure()
grid on
stem(1:N, On);
legend("\Thetan");
title("Phase plot");

function point = findStartPoint(old, center, period)
    point = center;
    
    while (abs(point - old) > period + 0.001)
       point = point - period; 
    end
    fprintf("Next period is %f\n", point);
end