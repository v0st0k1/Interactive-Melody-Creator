close all
clear all
clc 
figure; 
cam = webcam(1); 
set(gcf,'currentchar',' ');
img = snapshot(cam); 
lin=linspace(1,size(img,1),5);
lin=floor(lin);
while 1 
   img = snapshot(cam);  
   img(lin,:,:)=0;
   imshow(img,[]); 
   
end
close 
clear cam