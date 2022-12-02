% GENERATING DATA SETS FROM THE SIMPLE TURING SYSTEM:
% 
close all;

% BETSE pattern dataset

folderName = 'Z:\Andre\2021 BETSE Sim Output\Norm31';
mkdir(folderName);
folderName = [folderName, 'Ex21testBETSE'];
mkdir(folderName);


arffFile = [folderName, '218train_weka32today.arff']; % THE WEKA FILE
% arffFile = [folderName, 'test_weka32.arff']; % THE WEKA FILE
filename = 'Z:/Andre/2021 BETSE Output/Norm31/218train_weka32today.arff';

PatternTypes = {'P', 'NP'}; % For the weka you can use any number of pattern types, we use 2. Initialize the pattern names here.
% P : pattern, NP: nopattern


% patternSize
patternSize = 32; % A 32x32 grid will be used.  
labels = {'RED'}; % Rm : stands for Red mean, 
                 % Rv : stands for Red variance, (these labels have to be same as in the TSSL model checker)
                 
depth = 5; % The depth of the quad tree, (if you are going to change, make sure the matlab model checker still works.)
saveImages = 1; % True: saves the images in folder "folderName/Images32new"

% create the arfffile 
A = rand(patternSize);
tree = cell(1);
tree{1} = calculateQuadtree(A);
%tree{1} = tree{1}/tree{1}(1,1);

saveARFFTree(arffFile, tree, 0, labels, PatternTypes, depth);


positiveimagefolder1 = 'Z:\Andre\2021 BETSE Sim Output\Norm1';
listing = dir(positiveimagefolder1);
len=length(listing);
ind = [];
for ii = 1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end

listing = listing(ind);
len= length(listing);
posimageset1 = zeros(1,len);
for ii=1:len
    names = listing(ii).name;
    pos1filename = fullfile(positiveimagefolder1,names);
    posdata1=imread(pos1filename);
    posdata1=imageTrim(posdata1,2);
    posdata1=make32(posdata1);
    posdata1=double(posdata1(:,:,1));
    posdata1=posdata1./max(max(posdata1));
    tree{1} = calculateQuadtree(posdata1);
    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
end

if(saveImages == 1)
    
    imageFolder = [folderName, 'Images32_lilsetDre3'];
    mkdir(imageFolder);


    im = zeros(patternSize, patternSize, 3);
    % plot all:
    im(:,:,1) = TuringSimulation(patternSize, PatternParameters, false);
    imwrite(im, [imageFolder, 'PATTERN', '.png'],'png');

    for i=1:length(NPparameters)
        im(:,:,1) = TuringSimulation(patternSize, NPparameters(i), false);
        imwrite(im, [imageFolder, 'NO_PATTERN ', num2str(i), '.png'],'png');
    end

end