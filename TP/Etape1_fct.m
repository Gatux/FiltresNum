function [ R ] = Etape1_fct( R, theta0 )

p1 = R * exp(1i*theta0);
p2 = R * exp(-1i*theta0);

% Numérateur
H1B = 1;
% Dénominateur
H1A = [1 -(p1+p2) (p1*p2)];

%% Visualisation avec zplane
figure
zplane(0, [p1; p2]);

%% Observation de la réponse en fréquence et en phase du filtre
figure
freqz(H1B, H1A);
% Commentaire: il y a une résonance en amplitude

%% Filtrage d'un bruit blanc par le filtre
N = 1000;
x = wgn(N, 1, 1);
y = filter(H1B, H1A, x);
figure
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

