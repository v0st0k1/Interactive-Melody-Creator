function segmentos = segmentacion (senal,num_muestras,despl)
    %buffer(senal,tam_segmento,solapamiento = tam_segmento - despl);
    segmentos = buffer(senal,num_muestras,num_muestras-despl,'nodelay');
end