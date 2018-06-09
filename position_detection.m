function [x,y] = position_detection(frame)
    img_rojo = frame(:,:,1);
    img_gray = 255-rgb2gray(frame);
    img_gray = rgb2gray(frame);
    resultado = img_rojo-img_gray;
    umbral = 80;
    resultado = resultado >= umbral;
    ele = strel('square',3);
    resultado_apertura = imopen(resultado,ele);
    %figure,imshow(resultado_apertura);
    bbox = regionprops(resultado_apertura,'BoundingBox');
    if ~isempty(bbox)
        bbox = bbox.BoundingBox;
        x = floor(bbox(1)+bbox(3)/2);
        y = floor(bbox(2)-0.3*bbox(4));
    else
        x=-1;
        y=-1;
    end
end