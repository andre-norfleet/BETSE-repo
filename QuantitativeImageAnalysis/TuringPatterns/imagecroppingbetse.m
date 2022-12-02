rgbImage = imread('fig_final_Vmem_2D_2square.png');
choppedarray = rgbImage(200:800,100:700,:);

mkdir Z:/Andre/test915_21
imwrite(choppedarray,'Z:/Andre/test915_21/croppedImagetestBETSE3.png');