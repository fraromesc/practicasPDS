% Programa P1_3
% Modificación del número de bits.

A = importdata('Entrada.wav');
x = A.data;             % Se renombran los datos de audio.
Fs = A.fs;              % Se renombra la frecuencia de muestreo.

% Se calcula el máximo de los dos canales.
ymax = max(max(abs(x)));

% Redondeo a un número menor de bits.
nbits = 2;          % Nuevo número de bits a utilizar en cada canal.
delta = ymax*(2^(-nbits))*2;
niveles = -ymax:delta:ymax-delta;
yround = round(x/delta)*delta;

% Esto realmente deja 2^n+1 niveles, porque permite yround = ymax
% (simétrico de yround = -ymax, que sí tiene que estar permitido.
% Eliminamos esos puntos asignándoles el último nivel válido.
yround(yround == ymax) = niveles(end);

hfig = figure(11);
set(hfig,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.95 0.95]);

subplot(2,1,1)
plot(0:length(x)-1,x,'b')
title('Señal de audio original')
xlabel('Tiempo (n)'),ylabel('Amplitud')

subplot(2,1,2)
plot(0:length(yround)-1,yround,'b')
title(strcat(['Señal de audio con ' num2str(nbits) ' bits']))
xlabel('Tiempo (n)'),ylabel('Amplitud')

% Escritura del nuevo archivo .wav
audiowrite('Salida.wav',yround,Fs);
%auwrite(yround,fs,'Salida.wav');

