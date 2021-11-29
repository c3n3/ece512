clf; n = (-5:5); D_n = (1/(2.*pi).^2).*((2.*pi./(-1j.*n) + 1./(n.^2)).*exp(-1j.*n.*2*pi) - 1./(n.^2));
subplot(1,2,1); stem(n,abs(D_n),'.k');
xlabel('n'); ylabel('|D_n|');
subplot(1,2,2); stem(n,angle(D_n),'.k');
xlabel('n'); ylabel('\angle D_n [rad]')