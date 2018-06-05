function segmentos_enventanados = enventanado(segmentos,ventana)     
    if ventana == 'hamming'
        aux = hamming(size(segmentos,1));
        segmentos_enventanados = segmentos.*aux;
    elseif ventana == 'hanning'
        aux = hanning(size(segmentos,1));
        segmentos_enventanados = segmentos.*aux;
    elseif ventana == 'rectangular'
        aux = rectwin(size(segmentos,1));
        segmentos_enventanados = segmentos.*aux;
    else
        error('La ventana debe ser hamming, hanning o rectangular');
    end

end
