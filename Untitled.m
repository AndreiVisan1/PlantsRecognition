%Read image by its file name
 I = imread('C:\Users\Andrei\Desktop\ph.jpg');
 %Convert it from RGB to HSV
 hsv = rgb2hsv(I);
 %Get its hue, saturation and value
 H = hsv(:, :, 1).*255;
 S = hsv(:, :, 2).*255;
 V = hsv(:, :, 3).*255;
 %Set the hue value to zero if it
 %less than 50 or great than 150
 H((H < 50) | (H > 150)) = 0;
 %Set the hue value of wheat straw
 % pixel to zero
 H(H > 49 & H < 60 & S > 5 & S < 50 & V > 150) = 0;
 %Thresholding
 T = 49; %T can be any value in [1, 49]
 t = T./255;
 BW = im2bw(H, t);
 %Delete the objects less than 100 pixels
 BW = bwareaopen(BW, 100);
 %Show the identification result
 figure, imshow(BW);