% Read Input Image
input_image = imread('abcd.jpeg');
% input_image = imread('L3BAND2.tif');
  
% Displaying Input Image
input_image = uint8(input_image);
figure, imshow(input_image); title('Input Image');
  
% Convert the truecolor RGB image to the grayscale image
input_image = rgb2gray(input_image);
  
% Convert the image to double
input_image = double(input_image);
  
% Pre-allocate the filtered_image matrix with zeros
filtered_image = zeros(size(input_image));
  
% Robert Operator Mask
Mx = [1 2 1; 0 0 0 ; -1 -2 -1];
My = [-1 0 1; -2 0 2; -1 0 1];
  
% Edge Detection Process
% When i = 1 and j = 1, then filtered_image pixel  
% position will be filtered_image(1, 1)
% The mask is of 3x3, so we need to traverse 
% to filtered_image(size(input_image, 1) - 2
%, size(input_image, 2) - 2)
for i = 1:size(input_image, 1) - 3
    for j = 1:size(input_image, 2) - 3
  
        % Gradient approximations
        Gx = sum(sum(Mx.*input_image(i:i+2, j:j+2)));
        Gy = sum(sum(My.*input_image(i:i+2, j:j+2)));
                 
        % Calculate magnitude of vector
        filtered_image(i, j) = sqrt(Gx.^2 + Gy.^2);
         
    end
end
  
% Displaying Filtered Image
filtered_image = uint8(filtered_image);
figure, imshow(filtered_image); title('Filtered Image');
  
% Define a threshold value
thresholdValue = 100; % varies between [0 255]
output_image = max(filtered_image, thresholdValue);
output_image(output_image == round(thresholdValue)) = 0;
  
% Displaying Output Image
output_image = im2bw(output_image);
figure, imshow(output_image); title('Edge Detected Image');