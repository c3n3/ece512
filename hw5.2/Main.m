res = fopen('square-400ms.txt');
C = textscan(res, "%f %f", 'Delimiter', '\n');
times = C(1,1);
times = times{1};
x = C(1,2);
x = x{1};
w0 = 2*pi / (times(1) + times(end) + (times(2) - times(1)));
NUM_Ns = 8;
cn = zeros(NUM_Ns, 1);
on = zeros(NUM_Ns, 1);

for n = 1:NUM_Ns
    [an, bn] = Series(times, x, n, w0);
    cn(n) = sqrt(an.^2 + bn.^2);
    on(n) = atan(-bn./an);
end

s = size(times);
fun = zeros(s(1),1);
for n = 1:NUM_Ns
    for i = 1:size(times)
        t = times(i);
        fun(i) = fun(i) + cn(n)*cos(w0*n*t + on(n));
    end
end
fun = fun * w0/pi;
fun = mean(x) + fun;
figure()
hold on
plot(times, x)
plot(times, fun)
hold off


figure()
grid on
stem(1:NUM_Ns, cn);
legend("Cn");
title("Amplitude plot");

figure()
grid on
stem(1:NUM_Ns, on);
legend("\Thetan");
title("Phase plot");