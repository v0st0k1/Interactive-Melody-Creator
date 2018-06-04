clear all; close all;
cam = webcam(1);

img = snapshot(cam);
i = imsubtract(img(:,:,1), rgb2gray(img)); 
i = medfilt2(i, [4 4]);
i = im2bw(i,0.08);
i = bwareaopen(i,300);
iAnt= i;

figure,imshow(iAnt);

disp('ahora');
pause(3);

img = snapshot(cam);
img=fliplr(img);
i = imsubtract(img(:,:,1), rgb2gray(img)); % el subtrac, 1 para rojo, 2 verde 3 azul
i = medfilt2(i, [4 4]);
i = im2bw(i,0.06); %% a menor valor más color reconoce
i = bwareaopen(i,100);
resta = i-iAnt;
iAnt=i;
resta = bwareaopen(resta,2000);

figure,imshow(resta);

[x,y]=find(resta==1);

% while true
%     imshow(snapshot(cam));
% end