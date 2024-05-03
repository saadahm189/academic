clear;clc;
% Read the image
originalImage = rgb2gray(imread('img/sample.jpg')); % Change 'your_image_file.jpg' to your image file name

% Convert the image to double
originalImage = im2double(originalImage);

% Define the smoothing kernel (example: 3x3 Gaussian kernel)
kernel = [1, 2, 1; 2, 4, 2; 1, 2, 1] / 16; % Normalize to ensure kernel sums to 1

% Pad the image to handle borders for smoothing
padSize = floor(size(kernel,1) / 2);
paddedImage = padarray(originalImage, [padSize, padSize], 'replicate');

% Initialize smoothed image
smoothedImage = zeros(size(originalImage));

% Loop over each pixel to apply smoothing
for i = 1:size(originalImage, 1)
    for j = 1:size(originalImage, 2)
        % Extract the neighborhood
        neighborhood = paddedImage(i:i+2*padSize, j:j+2*padSize);
        
        % Initialize smoothed pixel value
        smoothedPixel = 0;
        
        % Loop over each element in the neighborhood and apply the kernel
        for m = 1:size(kernel, 1)
            for n = 1:size(kernel, 2)
                smoothedPixel = smoothedPixel + kernel(m, n) * neighborhood(m, n);
            end
        end
        
        % Assign the smoothed pixel value to the output image
        smoothedImage(i, j) = smoothedPixel;
    end
end

% Define the sharpening kernel (example: Laplacian kernel)
sharpeningKernel = [0, -1, 0; -1, 5, -1; 0, -1, 0]; 

% Pad the smoothed image to handle borders for sharpening
padSize = floor(size(sharpeningKernel,1) / 2);
paddedSmoothedImage = padarray(smoothedImage, [padSize, padSize], 'replicate');

% Initialize sharpened image
sharpenedImage = zeros(size(smoothedImage));

% Loop over each pixel to apply sharpening
for i = 1:size(smoothedImage, 1)
    for j = 1:size(smoothedImage, 2)
        % Extract the neighborhood
        neighborhood = paddedSmoothedImage(i:i+2*padSize, j:j+2*padSize);
        
        % Initialize sharpened pixel value
        sharpenedPixel = 0;
        
        % Loop over each element in the neighborhood and apply the kernel
        for m = 1:size(sharpeningKernel, 1)
            for n = 1:size(sharpeningKernel, 2)
                sharpenedPixel = sharpenedPixel + sharpeningKernel(m, n) * neighborhood(m, n);
            end
        end
        
        % Assign the sharpened pixel value to the output image
        sharpenedImage(i, j) = sharpenedPixel;
    end
end

% Display original, smoothed, and sharpened images side by side
figure;
subplot(1,3,1);
imshow(originalImage);
title('Original Image');
subplot(1,3,2);
imshow(smoothedImage);
title('Smoothed Image');
subplot(1,3,3);
imshow(sharpenedImage);
title('Sharpened Image');