
% script for optimized parameters:


close all;


% optimized parameters 1:
%CA	2.25
%CB	29.416666666666664

% optimized parameters 2:
%CA	3.75
%CB	28.75

% optimized parameters 3:
%CA	6.25
% CB	29.416666666666664

PatternParameters.CA = 6.25;
PatternParameters.CB = 29.416666666666664;
PatternParameters.dt = 0.01;
PatternParameters.T = 60;



folderName = [ '/Users/ebru/Desktop/TuringDataSet/OptimizedParameters3/'];
mkdir(folderName);

im = zeros(32,32,3);

for testNum = 1:20;

fileNameBase = [folderName , 'opt3_observation_',  num2str(testNum)];

A = TuringSimulation(32, PatternParameters, false);

im(:,:,1) = A;
imwrite(im, [fileNameBase '.png'],'png');

end


