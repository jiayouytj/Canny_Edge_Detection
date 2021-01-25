
function BinaryEdgeImage = HysteresisThreshold(magnitudeImage,minThresh,maxThresh)
pixelAboveMini = magnitudeImage > minThresh; %find pixels above minimal threshold
[row, colomn] = find(magnitudeImage > maxThresh); %find row and colomn of pixels above maximal threshold
BinaryEdgeImage = bwselect(pixelAboveMini, colomn, row, 4); %connectivity = 4
end
% Write your function here