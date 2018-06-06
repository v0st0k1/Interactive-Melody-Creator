function [x,y] = finger_detection(frame,limit)
%Entrada:
%frame = imagen de entrada, en gris y double (usar double(rgb2gray(imagen))
%limit = limite para la deteccion, si coeficiente de correlacion > limit
%        la región será el deo (0.75 normalmente)

[frameHeight,frameWidth] = size(frame);

%Cargar plantilla
template = double(imread('claveSol.tiff'));

%Calculo de la correlacion
n_template = numel(template);
mat_conv = ones(size(template))./n_template;

frMean = conv2(frame,mat_conv,'same');
tmMean = mean(template(:));

frStd = sqrt(conv2(frame.^2,mat_conv,'same')-frMean.^2);
tmStd = std(template(:));

flip = fliplr(flipud(template - tmMean));

corr1 = conv2(frame,flip,'same')./n_template;
corr2 = frMean.*sum(template(:)-tmMean);
correlation = (corr1-corr2)./(frStd.*tmStd);

%Buscar region mas parecida
[val,pos] = max(correlation(:));
[row,col] = ind2sub([size(correlation,1),size(correlation,2)],pos);

if(val>=limit)
    %Para devolver punto: con el max devuelve la esquina superior izquierda
    %si queremos otra parte solo habria que ir ajustando sumando o restando
    %una parte del tamaño de la plantilla
    %(ahora la mitad-mitad)
    y = max(1,row-round(size(template,1)/2));% -size(template,1)/2;
    x = frameWidth - max(1,col-round(size(template,2)/2)) - size(template,2)/2;
else
    y = [];
    x = [];
end

end