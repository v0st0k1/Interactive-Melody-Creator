function senal=grabacion(t,Fs,Ch,num_bits)
    if num_bits~=4 & num_bits~=16 & num_bits~=24
        error('El numero de bits debe ser 8, 16 o 24');
    end
    if Ch~=1 & Ch~=2
        error('El canal debe ser 1 para mono y 2 para estereo');
    end
    
    obj = audiorecorder(Fs,num_bits,Ch);
    disp('Start speaking');
    recordblocking(obj,t);
    disp('End of recording');
    senal=getaudiodata(obj);

end