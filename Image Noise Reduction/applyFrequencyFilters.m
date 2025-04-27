function [lowFilteredImage, highFilteredImage, lowPassFilter, highPassFilter] = applyFrequencyFilters(shiftedFourier, imageHeight, imageWidth, filterRadius)
    
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
end
