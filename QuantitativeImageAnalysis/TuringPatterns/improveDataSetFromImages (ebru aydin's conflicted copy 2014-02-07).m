

% improve the dataset :
folderName = '/Users/ebru/Desktop/TuringDataSet/mbr_cluster/testSim311_2/';

arffFile = '/Users/ebru/Desktop/TuringDataSet/mbr_cluster/Learning3/train_weka32turingAdd2.arff';


%6.583333
%CB	9.916667

% patternSize
patternSize = 32;
labels = {'Rm', 'Rv'};

depth = 5;


imageBaseS = 'S_';
bl = length(imageBaseS);

fileList = dir(folderName);

for i=1:length(fileList)
    if(length(fileList(i).name) > bl && sum(fileList(i).name(1:bl) == imageBaseS) == bl)
         fileList(i).name
         A = imread([folderName, fileList(i).name]);
         A = A(:,:,1); % for now we are only interested in the red channel
         A = double(A)/255;
          
         [ tree{1}, tree{2}] = calculateQuadtree(A);
         saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    end
end





