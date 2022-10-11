% Programa P3_1
% C�lculo de la se�al recuperada a partir de la DFT.

A = importdata('Entrada.wav');
x = A.data;             % Se renombran los datos de audio.
Fs = A.fs;              % Se renombra la frecuencia de muestreo.

N = length(x)/2;          % N�mero de puntos de la DFT.
X_DFT = fft(x,N);       % DFT de x.
x_DFT = ifft(X_DFT);	% IDFT (se�al recuperada).

% Dibujamos las se�ales en el tiempo
hfig = figure(1);
set(hfig,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.95 0.95]);

subplot(2,1,1)
stem(0:length(x)-1,x)
title('Se�al de audio original')
xlabel('Tiempo (n)')
ylabel('Amplitud')
subplot(2,1,2)
stem(0:N-1,x_DFT)
title('Se�al de audio recuperada')
xlabel('Tiempo (n)')
ylabel('Amplitud')

% Escritura del nuevo archivo .wav
audiowrite('Salida_1.wav',x_DFT,Fs);
%auwrite(x,Fs,'Salida_1.wav');
