% Section 1 ==============================================================
clc;                   close all;                 clear;

originalImage = imread('coins.png');
grayImage = rgb2gray(originalImage);

subplot(5,3,1), imshow(grayImage)
title('Section One - Original image || the grayscale image'); axis on;
%==========================================================================
fourierTransformed = fft2(grayImage);
fourierMagnitude = log(1 + abs(fourierTransformed));

subplot(5,3,4), imshow(fourierMagnitude, []);
title('The fourier magnitude'); axis on;
%==========================================================================
shiftedFourier = fftshift(fourierTransformed);
shiftedMagnitude = log(1 + abs(shiftedFourier));

subplot(5,3,7), imshow(shiftedMagnitude, []);
title('The shifted Magnitude'); axis on;
%==========================================================================
[imageHeight, imageWidth] = size(shiftedFourier);
filterRadius = input('(for the original image), How much filter radius do you want?: ');

[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2; 
yCoordinates = yCoordinates - imageHeight / 2;

distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  
lowPassFilter = distanceFromCenter < filterRadius; 
highPassFilter = ~lowPassFilter;

lowFilteredFourier = shiftedFourier .* lowPassFilter;
highFilteredFourier = shiftedFourier .* highPassFilter;

lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));

lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));

subplot(5, 3, 10); imshow(lowPassFilter, []); title('Low-frequency filter'); axis on;
subplot(5, 3, 13); imshow(lowFilteredImage, []); title('Low-frequency image'); axis on;


%% Section 2===============================================================
Noise_level = input('How much noise you want to add? (input 0.1 for 10% & so on): ');
%I installed toolbox package to use 'imnoise'
Noisy_image = imnoise(grayImage, 'salt & pepper', Noise_level);

subplot(5,3,2), imshow(Noisy_image)
title('Filteration by taking low frequencies || The nosiy image'); axis on;
%==========================================================================
fourierTransformed = fft2(Noisy_image);
fourierMagnitude = log(1 + abs(fourierTransformed));

subplot(5,3,5), imshow(fourierMagnitude, []);
title('The fourier magnitude'); axis on;
%==========================================================================
shiftedFourier = fftshift(fourierTransformed);
shiftedMagnitude = log(1 + abs(shiftedFourier));

subplot(5,3,8), imshow(shiftedMagnitude, []);
title('The shifted Magnitude'); axis on;
%==========================================================================
[imageHeight, imageWidth] = size(shiftedFourier);
filterRadius = input('(for the noisy image), How much filter radius do you want?: ');

[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2; 
yCoordinates = yCoordinates - imageHeight / 2;

distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  
lowPassFilter = distanceFromCenter < filterRadius; 
highPassFilter = ~lowPassFilter;

lowFilteredFourier = shiftedFourier .* lowPassFilter;
highFilteredFourier = shiftedFourier .* highPassFilter;

lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));

lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));

subplot(5, 3, 11); imshow(lowPassFilter, []); title('Low-frequency filter'); axis on;
subplot(5, 3, 14); imshow(lowFilteredImage, []); title('Low-frequency image'); axis on;


%% Section 3===============================================================
Output_med = medfilt2(Noisy_image, [3 3]);

subplot(5,3,3), imshow(Output_med)
title('filteration by digital filter || The filtered image');  axis on;
%==========================================================================
fourierTransformed = fft2(Output_med);
fourierMagnitude = log(1 + abs(fourierTransformed));

subplot(5,3,6), imshow(fourierMagnitude, []);
title('The fourier magnitude');  axis on;
%==========================================================================
shiftedFourier = fftshift(fourierTransformed);
shiftedMagnitude = log(1 + abs(shiftedFourier));

subplot(5,3,9), imshow(shiftedMagnitude, []);
title('The shifted Magnitude'); axis on;
%==========================================================================
[imageHeight, imageWidth] = size(shiftedFourier);
filterRadius = input('(for the digital filtered image), How much filter radius you want?: ');

[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2; 
yCoordinates = yCoordinates - imageHeight / 2;

distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  
lowPassFilter = distanceFromCenter < filterRadius; 
highPassFilter = ~lowPassFilter;

lowFilteredFourier = shiftedFourier .* lowPassFilter;
highFilteredFourier = shiftedFourier .* highPassFilter;

lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));

lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));

subplot(5, 3, 12); imshow(lowPassFilter, []); title('Low-frequency filter'); axis on;
subplot(5, 3, 15); imshow(lowFilteredImage, []); title('Low-frequency image'); axis on;