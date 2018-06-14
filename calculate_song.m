function song=calculate_song(notes)
amp=10;
fs=20500;  % sampling frequency
song=[];
for i=1:size(notes,1)
    duration=notes(i,3)/2;
    switch (notes(i,1))
        case 0 %do
            aux=261.626;
        case 1 %do#
            aux=277.183;
        case 2 %re
            aux=293.665;
        case 3 %re#
            aux=311.127;
        case 4 %mi
            aux=329.628;
        case 5 %fa
            aux=349.228;
        case 6 %fa#
            aux=369.994;
        case 7 %sol
            aux=391.995;
        case 8 %sol#
            aux=415.305;
        case 9 %la
            aux=440;
        case 10 %la#
            aux=466.164;
        case 11 %si
            aux=493.883;
    end
    
    freq=aux*notes(i,2);
    values=0:1/fs:duration;
    song=[song amp*sin(2*pi* freq*values)];
end