clear;
clc;
close all;

original=imread('img/r.jpg');
a=imread('img/headr.png');
b=imread('img/bodyr.png');

d=a+b;
e=d-b;
f=d-a;

subplot(2,2,1);
imshow(original);
title("Image 1");
subplot(2,2,2);
imshow(e);
title("Image 2");
subplot(2,2,3);
imshow(f);
title("Image 3");
subplot(2,2,4);
imshow(d);
title("Image 4");