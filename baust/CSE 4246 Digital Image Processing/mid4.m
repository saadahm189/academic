clear;
clc;

img=imread('onion.png');
subplot(3,3,1);
imshow(img);

% Addition:
subplot(3,3,2);
imshow(img+100);

% Addition:
subplot(3,3,3);
imshow(img-100);

% Addition:
subplot(3,3,4);
imshow(img*2);

% Addition:
subplot(3,3,5);
imshow(img/2);