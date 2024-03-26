clear;
clc;
close all;

a=imread('img/saad.png');
b=imread('img/saad.png');

c=a+b;                  % addition
d=a-b;                  % subtraction
e=a.*b;                 % multiplication
f=b+50;                % adding a constant
g=a-100;              % subtracting a constant
h=255-b;              % negative of a image

subplot(331),imshow(a),title('Image 1')
subplot(332),imshow(b),title('Image 2')
subplot(333),imshow(c),title('Addition')
subplot(334),imshow(d),title('Subtraction')
subplot(335),imshow(e),title('Multiplication')
subplot(336),imshow(f),title('Adding a constant(50) to Image 2')
subplot(337),imshow(g),title('Subtracting a constant(100) from Image 1')
subplot(338),imshow(h),title('Negative of Image 2')