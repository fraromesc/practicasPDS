% Programa P3_5
% Ilustración de la relación entre convolución lineal y convolución circular.

A = importdata('Entrada.wav');
x = A.data;                 % Se renombran los datos de audio.
Fs = A.fs;                  % Se renombra la frecuencia de muestreo.
h = 0.2*ones(40001,1);        % Respuesta impulsiva del filtro.

y_lin = conv(x,h);			% Convolución lineal.

N = length(x)+60000;              % Longitud de las DFTs.
X = fft(x,N);
H = fft(h,N);
Y_cir = X.*H;
y_cir = ifft(Y_cir,N);      % Convolución circular.
y_cir = real(y_cir);		% Se elimina la componente imaginaria residual.	

hfig = figure(5);
set(hfig,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.95 0.95]);

subplot(2,1,1);
plot(0:length(y_lin)-1,y_lin);grid
title('Convolución lineal entre x(n) y h(n)');
xlabel('Tiempo (n)')
ylabel('Amplitud')
subplot(2,1,2);
plot(0:length(y_cir)-1,y_cir);grid
title('Convolución circular entre x(n) y h(n)');
xlabel('Tiempo (n)')
ylabel('Amplitud')

audiowrite('Salida_lin.wav',y_lin,Fs);
%auwrite(yl/4,Fs,'Salida_l.wav');
audiowrite('Salida_cir.wav',y_cir,Fs);
%auwrite(yc/4,Fs,'Salida_c.wav');

