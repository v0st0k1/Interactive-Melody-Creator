function salida = magnitud (segmentos,ventana) 
    salida = sum(abs(segmentos) .* ventana);
end