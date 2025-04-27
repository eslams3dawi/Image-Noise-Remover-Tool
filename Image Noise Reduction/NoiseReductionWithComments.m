%% Section 1 ==================================================================1
clc;                    close all;                      clear;

originalImage = imread('coins.png');
grayImage = rgb2gray(originalImage);
%figure('Name', 'The Gray Image')
%imshow(grayImage)

subplot(5,3,1), imshow(grayImage)
title('Section One - Original image || the grayscale image');

%====================================================================2
%fourier
fourierTransformed = fft2(grayImage);
fourierMagnitude = log(1 + abs(fourierTransformed));
%figure('Name', 'Fourier Magnitude'); 

subplot(5,3,4), imshow(fourierMagnitude, []);
title('The fourier magnitude');
%====================================================================3
%shifted
shiftedFourier = fftshift(fourierTransformed);
shiftedMagnitude = log(1 + abs(shiftedFourier));
%figure('Name', 'Fourier Frequency Shift'); 

subplot(5,3,7), imshow(shiftedMagnitude, []);
title('The shifted Magnitude');

%=====================================================================
%Inverse with ifft
[imageHeight, imageWidth] = size(shiftedFourier);
filterRadius = input('How much filter radius you want?: ');

[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2;  % Shift x-coordinates to center the image
yCoordinates = yCoordinates - imageHeight / 2; % Shift y-coordinates to center the image

distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  
lowPassFilter = distanceFromCenter < filterRadius; 
highPassFilter = ~lowPassFilter;

lowFilteredFourier = shiftedFourier .* lowPassFilter;
highFilteredFourier = shiftedFourier .* highPassFilter;

lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));

lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));

% Display the four subplots for the low-pass filter, high-pass filter, low-pass filtered image, and high-pass filtered image
subplot(5, 3, 10); imshow(lowPassFilter, []); title('Low-frequency filter'); axis on;
subplot(5, 3, 13); imshow(lowFilteredImage, []); title('Low-frequency image'); axis on;





%% Section 2==========================================================
%Add noise of type (salt and pepper noise)==========================4
%noisy image
Noise_level = input('How much noise you want to add? (input 0.1 for 10% & so on): ');
%I installed toolbox package to use 'imnoise'
Noisy_image = imnoise(grayImage, 'salt & pepper', Noise_level);

subplot(5,3,2), imshow(Noisy_image)
title('Filteration by taking low frequencies || The nosiy image');

%====================================================================5
fourierTransformed = fft2(Noisy_image);
fourierMagnitude = log(1 + abs(fourierTransformed));
%figure('Name', 'Fourier Magnitude'); 

subplot(5,3,5), imshow(fourierMagnitude, []);
title('The fourier magnitude');
%====================================================================6
%shifted
shiftedFourier = fftshift(fourierTransformed);
shiftedMagnitude = log(1 + abs(shiftedFourier));
%figure('Name', 'Fourier Frequency Shift'); 

subplot(5,3,8), imshow(shiftedMagnitude, []);
title('The shifted Magnitude');

%=====================================================================
%Inverse with ifft
[imageHeight, imageWidth] = size(shiftedFourier);
filterRadius = input('How much filter radius you want?: ');

[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2;  % Shift x-coordinates to center the image
yCoordinates = yCoordinates - imageHeight / 2; % Shift y-coordinates to center the image

distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  
lowPassFilter = distanceFromCenter < filterRadius; 
highPassFilter = ~lowPassFilter;

lowFilteredFourier = shiftedFourier .* lowPassFilter;
highFilteredFourier = shiftedFourier .* highPassFilter;

lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));

lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));

% Display the four subplots for the low-pass filter, high-pass filter, low-pass filtered image, and high-pass filtered image
subplot(5, 3, 11); imshow(lowPassFilter, []); title('Low-frequency filter'); axis on;
subplot(5, 3, 14); imshow(lowFilteredImage, []); title('Low-frequency image'); axis on;





%% Section 3=========================================================
% Reduce the noise by Median filter (3 by 3)========================7
Output_med = medfilt2(Noisy_image, [3 3]);

subplot(5,3,3), imshow(Output_med)
title('filteration by digital filter || The filtered image');
%==================================================================5
fourierTransformed = fft2(Output_med);
fourierMagnitude = log(1 + abs(fourierTransformed));
%figure('Name', 'Fourier Magnitude'); 

subplot(5,3,6), imshow(fourierMagnitude, []);
title('The fourier magnitude');
%==================================================================6
%shifted
shiftedFourier = fftshift(fourierTransformed);
shiftedMagnitude = log(1 + abs(shiftedFourier));
%figure('Name', 'Fourier Frequency Shift'); 

subplot(5,3,9), imshow(shiftedMagnitude, []);
title('The shifted Magnitude');

%=====================================================================
%Inverse with ifft
[imageHeight, imageWidth] = size(shiftedFourier);
filterRadius = input('How much filter radius you want?: ');

[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2;  % Shift x-coordinates to center the image
yCoordinates = yCoordinates - imageHeight / 2; % Shift y-coordinates to center the image

distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  
lowPassFilter = distanceFromCenter < filterRadius; 
highPassFilter = ~lowPassFilter;

lowFilteredFourier = shiftedFourier .* lowPassFilter;
highFilteredFourier = shiftedFourier .* highPassFilter;

lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));

lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));

% Display the four subplots for the low-pass filter, high-pass filter, low-pass filtered image, and high-pass filtered image
subplot(5, 3, 12); imshow(lowPassFilter, []); title('Low-frequency filter'); axis on;
subplot(5, 3, 15); imshow(lowFilteredImage, []); title('Low-frequency image'); axis on;