clear all;
close all;
%*********PARA GRABAR PATRONES*********
% load('./archivos mat/parametros.mat');
% 
% senal=grabacion(time,Fs,channel,n_bits);
% figure,plot(senal),title('Senal original');
% senal=preenfasis(senal, alfa);
%  
% segmentos = segmentacion(senal,N,despl);  
% 
% ventana = hamming(size(segmentos,1));
% 
% palabra = inicio_fin(segmentos,seg_ruido);
% magn_palabra = magnitud(palabra,ventana);
% 
% segmentos_enventanados = enventanado(palabra,'hamming');
% 
% palabra_senal = inv_segmentacion(segmentos_enventanados,despl);
% figure,plot(palabra_senal),title('Palabra recortada');
% 
% [car1,car2] = vectores_caracteristicas(segmentos_enventanados,3,12);
% patron_doce = [car1;car2];
% save('./archivos mat/patron_doce.mat','patron_doce');

% **********PRUEBA DEL ALGORITMO DTW*************
load('./archivos mat/patron_uno.mat');
load('./archivos mat/patron_dos.mat');
load('./archivos mat/patron_tres.mat');
load('./archivos mat/patron_cuatro.mat');
load('./archivos mat/patron_cinco.mat');
load('./archivos mat/patron_seis.mat');
load('./archivos mat/patron_siete.mat');
load('./archivos mat/patron_ocho.mat');
load('./archivos mat/patron_nueve.mat');
load('./archivos mat/patron_diez.mat');
load('./archivos mat/patron_once.mat');
load('./archivos mat/patron_doce.mat');

load('./archivos mat/parametros.mat');

senal=grabacion(time,Fs,channel,n_bits);
figure,plot(senal),title('Senal original');
senal=preenfasis(senal, alfa);
 
segmentos = segmentacion(senal,N,despl);  

ventana = hamming(size(segmentos,1));

palabra = inicio_fin(segmentos,seg_ruido);
magn_palabra = magnitud(palabra,ventana);

segmentos_enventanados = enventanado(palabra,'hamming');

palabra_senal = inv_segmentacion(segmentos_enventanados,despl);
figure,plot(palabra_senal),title('Palabra recortada');

[car1,car2] = vectores_caracteristicas(segmentos_enventanados,3,12);
test = [car1;car2];

valores=[];
uno=DTW(patron_uno, test)
valores=[valores uno];
dos=DTW(patron_dos, test)
valores=[valores dos];
tres=DTW(patron_tres, test)
valores=[valores tres];
cuatro=DTW(patron_cuatro, test)
valores=[valores cuatro];
cinco=DTW(patron_cinco, test)
valores=[valores cinco];
seis=DTW(patron_seis, test)
valores=[valores seis];
siete=DTW(patron_siete, test)
valores=[valores siete];
ocho=DTW(patron_ocho, test)
valores=[valores ocho];
nueve=DTW(patron_nueve, test)
valores=[valores nueve];
diez=DTW(patron_diez, test)
valores=[valores diez];
once=DTW(patron_once, test)
valores=[valores once];
doce=DTW(patron_doce, test)
valores=[valores doce];

[min,pos] = min(valores)
%close all;

%**********PRUEBA DEL ALGORITMO DTW CON RESTRICCION*************
% load('./archivos mat/patronUno.mat');
% load('./archivos mat/patronDos.mat');
% load('./archivos mat/patronTres.mat');
% load('./archivos mat/testUno.mat');
% load('./archivos mat/testDos.mat');
% load('./archivos mat/testTres.mat');
% 
% w=10;
% 
% a1=DTWR([car1_patron_uno; car2_patron_uno], [car1_test_uno; car2_test_uno],w);
% b1=DTWR([car1_patron_uno; car2_patron_uno], [car1_test_dos; car2_test_dos],w);
% c1=DTWR([car1_patron_uno; car2_patron_uno], [car1_test_tres; car2_test_tres],w);
% 
% a2=DTWR([car1_patron_dos; car2_patron_dos], [car1_test_uno; car2_test_uno],w);
% b2=DTWR([car1_patron_dos; car2_patron_dos], [car1_test_dos; car2_test_dos],w);
% c2=DTWR([car1_patron_dos; car2_patron_dos], [car1_test_tres; car2_test_tres],w);
% 
% a3=DTWR([car1_patron_tres; car2_patron_tres], [car1_test_uno; car2_test_uno],w);
% b3=DTWR([car1_patron_tres; car2_patron_tres], [car1_test_dos; car2_test_dos],w);
% c3=DTWR([car1_patron_tres; car2_patron_tres], [car1_test_tres; car2_test_tres],w);