clear all;
close all;

cam = webcam(1);
preview(cam);
img = snapshot(cam);
img_rojo = img(:,:,1);
img_gray = rgb2gray(img);
resultado = img_rojo-img_gray;
resultado = resultado >= 2000;
ele = strel('square',3);
resultado_apertura = imopen(resultado,ele);
figure,imshow(resultado_apertura,[]);
hold on;
bbox = regionprops(resultado_apertura,'BoundingBox');
if ~isempty(bbox)
    bbox = bbox.BoundingBox;
    plot(bbox(1)+bbox(3)/2,bbox(2)-0.3*bbox(4),'*r');
    title('Apertura');
    figure,imshow(resultado,[]);
    title('Sin apertura');
    figure,imshow(resultado,[]);
    title('Sin apertura');
else
    x=-1;
    y=-1;
end
