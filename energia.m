function salida = energia (segmentos,ventana)
	salida = sum(segmentos.^2 .* ventana.^2);
end