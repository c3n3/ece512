t = [0:0.000001:0.003];

iss = 15*sin(40000*t);

it = -25*exp(-32000*t).*sin(24000*t);

il = iss + it;

plot(t, iss)
xlabel("Time (s)")
ylabel("Current (mA)")
hold on
plot(t, it)
plot(t,il)
legend("Transient", "Total", "Steady State")
