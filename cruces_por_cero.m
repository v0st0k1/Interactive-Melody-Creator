function salida = cruces_por_cero(segmentos,ventana) 
    mat1 = segmentos(:,1:end-1);
    mat2 = segmentos(:,2:end);
    
    salida = sum( 0.5 * abs( sign(mat2) - sign(mat1) ).*ventana ) / (size(segmentos,2)-1);
end