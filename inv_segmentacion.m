function palabra = inv_segmentacion(segmentos,despl)
    palabra=[segmentos(:,1)'];
    for i=2:size(segmentos,2)
        palabra = [palabra segmentos(despl+1:end,i)'];
    end
    palabra=palabra';
end