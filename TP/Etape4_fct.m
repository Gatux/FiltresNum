function [ r ] = Etape4_fct( r )

theta0 = pi / 3;
R = 0.65;

p1 = R * exp(1i*theta0);
p2 = R * exp(-1i*theta0);

z1 = r * exp(1i*theta0);
z2 = r * exp(-1i*theta0);

% Numérateur
H2B = [1 -(z1+z2) (z1*z2)];
% Dénominateur
H2A = [1 -(p1+p2) (p1*p2)];

zplane(H2B, H2A);

figure
freqz(H2B, H2A);
figure
phasez(H2B, H2A);


%% Filtrage d'un bruit blanc par le filtre
N = 1000;
x = wgn(N, 1, 1);

y = filter(H2B, H2A, x);

figure;
subplot 221
plot(1:N, x);
xlabel('Echantillons');
ylabel('Amplitude');
title('Bruit blanc gaussien centre');

subplot 222
plot(1:N, y);
xlabel('Echantillons');
ylabel('Amplitude');
title('Bruit blanc gaussien centre filtré');

% DSP x
subplot 223
plot((0:N-1)/N - 0.5, abs(fftshift(fft(x))).^2);
xlabel('Echantillons');
ylabel('Amplitude');
title('DSP du bruit blanc gaussien centre');

% DSP y
subplot 224
plot((0:N-1)/N - 0.5, abs(fftshift(fft(y))).^2);
xlabel('Echantillons');
ylabel('Amplitude');
title('DSP du bruit blanc gaussien centre filtré');


end

