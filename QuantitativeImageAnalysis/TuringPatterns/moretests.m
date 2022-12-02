%steve = imread('fig_final_Vmem_2D_2square.png');
%steve2 = steve(:,:,3);

rgbImage = imread('bGA40_2p2FINcellprofAutoscale.png');
grayImage = min(rgbImage, [], 3);
binaryImage = grayImage < 200;
binaryImage = bwareafilt(binaryImage, 1);
[rows, columns] = find(binaryImage);
row1 = min(rows);
row2 = max(rows);
col1 = min(columns);
col2 = max(columns);
% Crop
croppedImage = rgbImage(row1:row2, col1:col2, :);