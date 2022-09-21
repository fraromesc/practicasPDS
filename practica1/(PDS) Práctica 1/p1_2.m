% Programa P1_2
% Representación de la DTFT de voces graves y agudas para distintas frecuencias de muestreo.

load DTFTs          % Carga las DTFTs para distintas frecuencias de muestreo.

rango_frec = 6*pi;
w = rango_frec*(-1:1/2520/16:1-1/2520/16)/2;
ind = 9;

for k = 9000:-1000:1000
    
    hfig = figure(10-ind);
    set(hfig,'Units', 'Normalized', 'OuterPosition', [0 0.05 0.95 0.95]);
    
    subplot(2,2,1)
    plot(w/pi,abs(DTFT_grave(10,:)));grid
    title('Magnitud de la DTFT de la voz grave, Fs = 10000 Hz')
    xlabel('\omega /\pi');
    ylabel('Amplitud');
    axis([-rango_frec/2/pi rango_frec/2/pi 0 350])

    subplot(2,2,3)
    plot(w/pi,abs(DTFT_grave(ind,:)));grid
    title(['Magnitud de la DTFT de la voz grave, Fs = ' num2str(k) ' Hz'])
    xlabel('\omega /\pi');
    ylabel('Amplitud');
    axis([-rango_frec/2/pi rango_frec/2/pi 0 350])

    subplot(2,2,2)
    plot(w/pi,abs(DTFT_aguda(10,:)));grid
    title('Magnitud de la DTFT de la voz aguda, Fs = 10000 Hz')
    xlabel('\omega /\pi');
    ylabel('Amplitud');
    axis([-rango_frec/2/pi rango_frec/2/pi 0 350])
    
    subplot(2,2,4)
    plot(w/pi,abs(DTFT_aguda(ind,:)));grid
    title(['Magnitud de la DTFT de la voz aguda, Fs = ' num2str(k) ' Hz'])
    xlabel('\omega /\pi');
    ylabel('Amplitud');
    axis([-rango_frec/2/pi rango_frec/2/pi 0 350])
    
    ind = ind-1;

end
