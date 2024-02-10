clear; clc;
img=imread('img/saad2.jpg');
imgGRAY=rgb2gray(img);
figure
subplot(1,3,1)
imshow(imgGRAY)
subplot(1,3,2:3)
imhist(imgGRAY)

J = histeq(imgGRAY);
figure
subplot(1,3,1)
imshow(J)
subplot(1,3,2:3)
imhist(J)