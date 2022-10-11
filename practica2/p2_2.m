% Programa P3_2
% Cálculo de la señal recuperada a partir de muestras de la DTFT.

A = importdata('Entrada.wav');
x = A.data;             % Se renombran los datos de audio.
Fs = A.fs;              % Se renombra la frecuencia de muestreo.

N = length(x)*2;                      % Número de muestras a tomar.
X_DTFT = freqz(x,1,N,'whole');      % Muestras de la DTFT.
x_DTFT = ifft(X_DTFT);				% IDFT de las muestras (señal recuperada).

% Dibujamos las señales en el tiempo
hfig = figure(2);
set(hfig,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.95 0.95]);

subplot(2,2,1)
stem(0:length(x)-1,x)
title('Señal de audio original')
xlabel('Tiempo (n)')
ylabel('Amplitud')
subplot(2,2,2)
stem(0:N-1,x_DTFT)
title('Señal de audio recuperada')
xlabel('Tiempo (n)')
ylabel('Amplitud')


% Escritura del nuevo archivo .wav
audiowrite('Salida_2.wav',x_DTFT,Fs);
%auwrite(xd,Fs,'Salida_2.wav');

