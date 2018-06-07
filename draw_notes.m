function res=draw_notes(img,posiciones)
    res=img;
    for i=1:size(posiciones,1)
        for ii=posiciones(i,2)-3:posiciones(i,2)+3
            for jj=posiciones(i,1)-3:posiciones(i,1)+3
                if (ii>0 && ii<size(img,1) && jj>0 && jj<size(img,2))
                    pos_i = ii;
                    pos_j = floor(size(img,2) - jj);
                    res(pos_i,pos_j,:) = 0;
                end
            end
        end
    end
end