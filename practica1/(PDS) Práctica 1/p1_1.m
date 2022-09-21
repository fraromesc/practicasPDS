% Programa P1_1
% Lectura de un fichero de audio.

A = importdata('Entrada.wav');
x = A.data;             % Se renombran los datos de audio.
Fs = A.fs;              % Se renombra la frecuencia de muestreo.
