%1=========================================================================
clc;                close all;            clear;             
%2=======================================================The Colorful Image
imagePath = input("Enter the path of the image: ", 's'); 
originalImage = imread(imagePath);   

subplot(4,2,1); imshow(originalImage) 
title('The Colorful Image'); axis on;
%3======================================================The Gray Image
grayImage = rgb2gray(originalImage); 
subplot(4,2,3); imshow(grayImage)
title('The Gray Image'); axis on;
%3==============================================The Fourier Magnitude Image
fourierTransformed = fft2(grayImage);  
fourierMagnitude = log(1 + abs(fourierTransformed)); 

subplot(4,2,5); imshow(fourierMagnitude, []);
title('The Fourier Magnitude Image'); axis on;
%4======================================The Fourier Frequency Shifted Image
shiftedFourier = fftshift(fourierTransformed); 
shiftedMagnitude = log(1 + abs(shiftedFourier)); 

subplot(4,2,7); imshow(shiftedMagnitude, []);
title('The Fourier Frequency Shifted Image'); axis on;
%5=============================================================Radius Input
[imageHeight, imageWidth] = size(shiftedFourier); 
filterRadius = input('How much filter radius you want?: ');
%5=========================================================Frequency Filter
[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2; 
yCoordinates = yCoordinates - imageHeight / 2;

distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  
lowPassFilter = distanceFromCenter < filterRadius; 
highPassFilter = ~lowPassFilter;
%6=========================================================================
lowFilteredFourier = shiftedFourier .* lowPassFilter;
highFilteredFourier = shiftedFourier .* highPassFilter;
%7=========================================================================
lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));
%7=========================================================================
lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));
%8=========================================================================
subplot(4, 2, 2); imshow(lowPassFilter, []); 
title('Low-frequency filter'); axis on;
subplot(4, 2, 4); imshow(lowFilteredImage, []); 
title('Low-frequency image'); axis on;

subplot(4, 2, 6); imshow(highPassFilter, []); 
title('High-frequency filter'); axis on;
subplot(4, 2, 8); imshow(highFilteredImage, []); 
title('High-frequency image'); axis on;