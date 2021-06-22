img4=imread('L3BAND2.tif');
% laplacian_mask = -1 * ones(3);
% laplacian_mask(2,2) = 8;

laplacian_mask = [0 -4 0;-4 16 -4; 0 -4 0];
img4_laplacian = conv2(img4, laplacian_mask, 'same');
img4_laplacian = img4 + uint8(img4_laplacian);
figure(4),
subplot(1,2,1), imshow(img4);
title(['\fontsize{8}Original Image ']);
subplot(1,2,2), imshow(img4_laplacian);
title(['\fontsize{8}Laplacian enhanced Image ']);