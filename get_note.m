function nota=get_note(senal,dtw_selected,w)
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

    senal=preenfasis(senal, alfa);

    segmentos = segmentacion(senal,N,despl);  

    ventana = hamming(size(segmentos,1));

    palabra = inicio_fin(segmentos,seg_ruido);
    magn_palabra = magnitud(palabra,ventana);

    segmentos_enventanados = enventanado(palabra,'hamming');

    palabra_senal = inv_segmentacion(segmentos_enventanados,despl);

    [car1,car2] = vectores_caracteristicas(segmentos_enventanados,3,12);
    test = [car1;car2];

    if dtw_selected==0
        valores=[];
        uno=DTW(patron_uno, test);
        valores=[valores uno];
        dos=DTW(patron_dos, test);
        valores=[valores dos];
        tres=DTW(patron_tres, test);
        valores=[valores tres];
        cuatro=DTW(patron_cuatro, test);
        valores=[valores cuatro];
        cinco=DTW(patron_cinco, test);
        valores=[valores cinco];
        seis=DTW(patron_seis, test);
        valores=[valores seis];
        siete=DTW(patron_siete, test);
        valores=[valores siete];
        ocho=DTW(patron_ocho, test);
        valores=[valores ocho];
        nueve=DTW(patron_nueve, test);
        valores=[valores nueve];
        diez=DTW(patron_diez, test);
        valores=[valores diez];
        once=DTW(patron_once, test);
        valores=[valores once];
        doce=DTW(patron_doce, test);
        valores=[valores doce];
    else
        valores=[];
        uno=DTWR(patron_uno, test,w);
        valores=[valores uno];
        dos=DTWR(patron_dos, test,w);
        valores=[valores dos];
        tres=DTWR(patron_tres, test,w);
        valores=[valores tres];
        cuatro=DTWR(patron_cuatro, test,w);
        valores=[valores cuatro];
        cinco=DTWR(patron_cinco, test,w);
        valores=[valores cinco];
        seis=DTWR(patron_seis, test,w);
        valores=[valores seis];
        siete=DTWR(patron_siete, test,w);
        valores=[valores siete];
        ocho=DTWR(patron_ocho, test,w);
        valores=[valores ocho];
        nueve=DTWR(patron_nueve, test,w);
        valores=[valores nueve];
        diez=DTWR(patron_diez, test,w);
        valores=[valores diez];
        once=DTWR(patron_once, test,w);
        valores=[valores once];
        doce=DTWR(patron_doce, test,w);
        valores=[valores doce];
    end
    
    [~,nota] = min(valores)

end