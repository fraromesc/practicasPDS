% Programa P3_1
% An�lisis espectral usando la DFT.

A = importdata('Entrada_2.wav');
x = A.data;             % Se renombran los datos de audio.
Fs = A.fs;              % Se renombra la frecuencia de muestreo.
l=length(x);
m=(8*10^-3)*Fs
M = m;%133.76921000;               % Longitud de la ventana de datos.
%x = x(12551:12550+M);   % Se�al de entrada recortada.

N =15000;% 10000;              % N�mero de puntos de la DFT. 
X = fft(x,N);           % DFT de N puntos de la se�al.

fig1 = figure(1);
set(fig1,'Units', 'Normalized', 'OuterPosition', [0 0.5 0.5 0.45]);
plot(0:M-1,x)
xlabel('�ndice n'), ylabel('Amplitud')
title('Se�al recortada')

fig2 = figure(2);
set(fig2,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.5 0.45]);
plot(0:N-1,abs(X)),grid on
xlabel('�ndice k'), ylabel('Magnitud')
title('Magnitud de la DFT')


