% Programa P3_3
% Ilustración de la propiedad de desplazamiento circular en el tiempo.

m = 35000;					% Desplazamiento temporal.

A = importdata('Entrada.wav');
x = A.data;             % Se renombran los datos de audio.
Fs = A.fs;              % Se renombra la frecuencia de muestreo.
N=length(x);
X = fft(x);                 % Cálculo de la DFT.
WN = exp(-1i*2*pi/N);   
fWN = WN.^((0:N-1)*m).';    % Señal exponencial.
X_desp = fWN.*X;			% Multiplicamos la DFT por la exponencial..
x_desp = ifft(X_desp);      % Señal desplazada circularmente en el tiempo.
x_desp = real(x_desp);     	% Se elimina la componente imaginaria residual.	

hfig = figure(3);
set(hfig,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.95 0.95]);

subplot(2,1,1);
stem(0:length(x)-1,x);grid
title('Secuencia original');
xlabel('Tiempo (n)')
ylabel('Amplitud')
subplot(2,1,2);
stem(0:N-1,x_desp);grid
xlabel('Tiempo (n)')
ylabel('Amplitud')
title('Secuencia desplazada circularmente');


audiowrite('Salida_3.wav',x_desp,Fs);