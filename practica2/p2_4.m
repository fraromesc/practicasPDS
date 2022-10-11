% Programa P3_4
% Ilustración de la propiedad de inversión circular.

x = (1:8)';
N = length(x);			% Longitud de la secuencia.
n = 0:N-1;				% Índices temporales.

X = fft(x);				% Cálculo de la DFT.
X_inv = X(1+mod(-n,N));	% Inversión circular de la DFT.
x_inv = ifft(X_inv);	% Señal invertida circularmente en el tiempo.
x_inv = real(x_inv);    % Se elimina la componente imaginaria residual.	

hfig = figure(4);
set(hfig,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.95 0.95]);

subplot(2,1,1);
stem(n,x);grid
title('Secuencia original');
xlabel('Tiempo (n)')
ylabel('Amplitud')
subplot(2,1,2);
stem(n,x_inv);grid
xlabel('Tiempo (n)')
ylabel('Amplitud')
title('Secuencia invertida circularmente');
