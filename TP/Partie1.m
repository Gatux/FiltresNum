% TP Filtres num�riques
% Gabriel Vermeulen - Maxime Peterlin
clear all; close all;
%% 1.1 Influence des p�les et des z�ros
theta0 = pi / 3;
R = 0.95;
p1 = R * exp(1i*theta0);
p2 = R * exp(-1i*theta0);

% Etape 1
%                       1
%H1(z) =   -------------------------
%          (1 - p1*z^-1)(1 - p2*z^-1)
%
% Num�rateur
H1B = 1;
% D�nominateur
H1A = [1 -(p1+p2) (p1*p2)];

%% Visualisation avec zplane
figure(1)
zplane(0, [p1; p2]);

%% Observation de la r�ponse en fr�quence et en phase du filtre
figure(2);
freqz(H1B, H1A);
% Commentaire: il y a une r�sonance en amplitude

%% Filtrage d'un bruit blanc par le filtre
N = 1000;
x = wgn(N, 1, 1);

y = filter(H1B, H1A, x);

figure(3);
subplot 221
plot(1:N, x);
xlabel('Echantillons');
ylabel('Amplitude');
title('Bruit blanc gaussien centre');

subplot 222
plot(1:N, y);
xlabel('Echantillons');
ylabel('Amplitude');
title('Bruit blanc gaussien centre filtr�');

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
title('DSP du bruit blanc gaussien centre filtr�');

% Remarque : On observe bien la r�sonnance li� au filtre.

%% Etape 2
theta=0:(pi/10):pi;
R = 0.95;
%% 1
Etape1_fct(R, theta(1));
% Resonance basse fr�quence
%% 2
Etape1_fct(R, tetha(2));
% R�sonance en f0 avec f0 qui aumgente
%% 3
Etape1_fct(R, tetha(3));
%% 4
Etape1_fct(R, tetha(4));
%% 5
Etape1_fct(R, tetha(5));
%% 6
Etape1_fct(R, tetha(6));
%% 7
Etape1_fct(R, tetha(7));
%% 8
Etape1_fct(R, tetha(8));
%% 9
Etape1_fct(R, tetha(9));
%% 10
Etape1_fct(R, tetha(10));
%% 11
Etape1_fct(R, tetha(11));
% Resonance haute fr�quence

%% Etape 3
R=0:0.05:1;
for i = R
    Etape1_fct(i, theta0);
end
% Pour des valeures petites de R il n'y a pas de r�sonance, plus on se
% rapproche du cercle unitaire plus la r�sonance est forte. Sur le cercle
% il y a divergence de la sortie -> instabilit�

%% Etape 4
clear all; close all;
theta0 = pi / 3;
R = 0.65;
r = 0.05;

p1 = R * exp(1i*theta0);
p2 = R * exp(-1i*theta0);


z1 = r * exp(1i*theta0);
z2 = r * exp(-1i*theta0);

% Num�rateur
H2B = [1 -(z1+z2) (z1*z2)];
% D�nominateur
H2A = [1 -(p1+p2) (p1*p2)];

zplane(H2B, H2A);

figure(2)
freqz(H2B, H2A);
figure(3)
phasez(H2B, H2A);


%% Filtrage d'un bruit blanc par le filtre
N = 1000;
x = wgn(N, 1, 1);

y = filter(H2B, H2A, x);

figure(3);
subplot 221
plot(1:N, x);
xlabel('Echantillons');
ylabel('Amplitude');
title('Bruit blanc gaussien centre');

subplot 222
plot(1:N, y);
xlabel('Echantillons');
ylabel('Amplitude');
title('Bruit blanc gaussien centre filtr�');

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
title('DSP du bruit blanc gaussien centre filtr�');


%% Etape 5
r=0:0.05:1;
for i = r
    Etape4_fct(i);
end
% Pour des valeures petites de R il n'y a pas de r�sonance, plus on se
% rapproche du cercle unitaire plus la r�sonance est forte. Sur le cercle
% il y a divergence de la sortie -> instabilit�




