% 2D FFT -- Low and High Frequency Filter

%1==========================================================================

clc;                % Clear the command window 
close all;          % Close all open figure windows 
clear;              % Remove all variables from the memory

%2========================================================================Figure1

originalImage = imread('MathImg.png'); % Load the original image from file
% Display the original colorful image
subplot(4,2,1); title('The Colorful Image'); imshow(originalImage); axis on;

grayImage = rgb2gray(originalImage);   % Convert the image to grayscale for simplicity (black & white)
%------------------ 0 to 255 (0 black & 255 white)
% Display the original grayscale image
subplot(4,2,3); title('The Grayscale Image'); imshow(grayImage); axis on;

%3========================================================================Figure2

% Apply the 2D Fast Fourier Transform (FFT) to convert the image from the spatial domain to the frequency domain
fourierTransformed = fft2(grayImage);  
%------------------- Convert the image to frequencies
%------------------- fft2 (2) to convert to 2Dimension
%------------------- Because the image is changed by x & y axis not by the time


% Take small magnitude by applying a logarithmic scale to compress the dynamic range
fourierMagnitude = log(1 + abs(fourierTransformed)); 
%------------------- use 
%                       log to reduce the number of frequencies to work with simplicity
%                       1 for if the log(0) is unknown
                            %for implementing a software principle called exception handling
%                       abs to prevent the negative & complex & 1
                            %because log(negative or complex) is unknown

%figure('Name', 'Fourier Magnitude'); 
%imshow(fourierMagnitude, []);

% Display the magnitude spectrum of the Fourier transform
subplot(4,2,5); title('The Fourier Magnitude Image'); imshow(fourierMagnitude, []); axis on;
%4========================================================================Figure3

% Shift the zero-frequency to the center of the image
% Shift the high-frequency to the corners of the image
shiftedFourier = fftshift(fourierTransformed); 
%--------------low frequenies shift to center 
                 %low frequencies means the pixels that less repeated
%--------------high frequenies shift to corner
                 %high frequencies means the pixels that more repeated


% Compute the shifted magnitude for visualization
shiftedMagnitude = log(1 + abs(shiftedFourier)); 

%figure('Name', 'Fourier Frequency Shift'); 
%imshow(shiftedMagnitude, []);

% Display the shifted magnitude of the Fourier transform
subplot(4,2,7); title('The Fourier Frequency Shifted Image'); imshow(shiftedMagnitude, []); axis on;
%5========================================================================ifft

[imageHeight, imageWidth] = size(shiftedFourier);  % Get the dimensions of the frequency matrix
filterRadius = input('How much filter radius you want?: ');

% Generate a 2D grid for the frequency domain
[xCoordinates, yCoordinates] = meshgrid(1:imageWidth, 1:imageHeight); 
xCoordinates = xCoordinates - imageWidth / 2;  % Shift x-coordinates to center the image
yCoordinates = yCoordinates - imageHeight / 2; % Shift y-coordinates to center the image

% Compute the distance of each point from the center
distanceFromCenter = sqrt(xCoordinates.^2 + yCoordinates.^2);  

% Create low-pass filter (keep low frequencies inside the circle)
lowPassFilter = distanceFromCenter < filterRadius; 

% Create high-pass filter (invert the low-pass filter to keep high frequencies)
highPassFilter = ~lowPassFilter;

%6==========================================================================

% Apply the low-pass filter to the frequency domain representation
% matrix * low = low
lowFilteredFourier = shiftedFourier .* lowPassFilter;


% Apply the high-pass filter to the frequency domain representation
% matrix & high = high
highFilteredFourier = shiftedFourier .* highPassFilter;

%7==========================================================================

% Perform the inverse FFT to transform the filtered frequency domain back to the spatial domain
lowFilteredImage = ifft2(ifftshift(lowFilteredFourier));
highFilteredImage = ifft2(ifftshift(highFilteredFourier));

% Convert the filtered images to uint8 format and take the absolute value (since we might get complex values)
lowFilteredImage = uint8(abs(lowFilteredImage));  
highFilteredImage = uint8(abs(highFilteredImage));

%8==========================================================================

% Display the low-pass filtered image
%figure, imshow(lowFilteredImage)

% Display the four subplots for the low-pass filter, high-pass filter, low-pass filtered image, and high-pass filtered image
subplot(4, 2, 2); title('Low-frequency filter'); imshow(lowPassFilter, []); axis on;
subplot(4, 2, 4); title('Low-frequency image'); imshow(lowFilteredImage, []); axis on;

subplot(4, 2, 6); title('High-frequency filter'); imshow(highPassFilter, []); axis on;
subplot(4, 2, 8); title('High-frequency image'); imshow(highFilteredImage, []); axis on;




%---------------------------------Result-------------------------------------%
%figure 1 → original
%figure 2 → fourier magnitude → high & low frequencies before shifting
%figure 3 → fourier magnitude → high & low frequencies after shifting 
                                                                     %low in center & high in corner
%Low-frequency filter
%white circle is the low frequencies & the black background is the out of scope
%High-frequency filter
%black circle is the high frequencies & the white background is the out of scope


%The difference between 
    %fourierTransformed: the magnitude that I work with
    %fourierMagnitude: just for visualizing

    %ShiftedFourier: the magnitued that I work with & got from fourierTransformed
    %ShiftedTransformed: just for visualizing