function segmentos = inicio_fin (segmentos, num_segmentos_ruido)
    %Paso1
    ventana = hamming(size(segmentos,1));
    Mn = magnitud(segmentos,ventana);
    Zn= cruces_por_cero(segmentos,ventana);
    
    %Paso2
    Ms = Mn(1:num_segmentos_ruido);
    Zs= Zn(1:num_segmentos_ruido);
    
    %Paso3
    UmbSupEnrg = 0.5*max(Mn);
    UmbInfEnrg = mean(Ms) + 2*std(Ms);
    UmbCruCero = mean(Zs) + 2*std(Zs);
    
    %Paso4
    n=num_segmentos_ruido+1;
    inds = find(Mn(n:end)>UmbSupEnrg);
    if isempty(inds)
        ln = n;
    else
        ln = n + inds(1);
    end

    %Paso5
    inds2 = find(Mn(1:ln) < UmbInfEnrg);
 
    le = inds2(end);
    
    %Paso6
    if le-25<n
		lz = n;
    else 
		lz = le-25;
    end
    
	inds3 = find(Zn(lz:le));
    z_aux = Zn(inds3);
    cont = 0;
    ptr = length(z_aux);
    while ptr ~= 0 && cont<3
        if z_aux(ptr) > UmbCruCero
            cont = cont+1;
        else
            cont = 0;
        end
        ptr = ptr-1;
    end
    
    if cont == 3
		inicio_senal = lz+ptr;
    else
        inicio_senal=le;
    end

    %********Final palabra*******
    %Paso4
    inds = find(Mn(1:end)>UmbSupEnrg);
    if isempty(inds)
        ln = length(Mn);
    else
        ln = inds(end);
    end

    %Paso5
    inds2 = find(Mn(ln:end) < UmbInfEnrg);
 
   le = inds2(1) + ln;
    
    
    %Paso6
    if le+25>length(Mn)
        lz = length(Mn);
    else 
        lz = le+25;
    end
    
    inds3 = find(Zn(le:lz));
    z_aux = Zn(inds3);
    cont = 0;
    ptr = 1;
    while ptr <= length(z_aux) && cont<3
        if z_aux(ptr) > UmbCruCero
            cont = cont+1;
        else
            cont = 0;
        end
        ptr = ptr+1;
    end
    
    if cont == 3
        final_senal= le + ptr;
    else
        final_senal=le;
    end
    
    %Devolver
    if final_senal > size(segmentos,2)
        final_senal = size(segmentos,2);
    end
    
    segmentos = segmentos(:,inicio_senal:final_senal);
end