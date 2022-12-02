
% GENERATING DATA SETS FROM THE SIMPLE TURING SYSTEM:
% 
close all;

% turing pattern dataset

folderName = 'Z:\Andre\2021 BETSE Sim Output\arfftrees';
mkdir(folderName);
folderName = [folderName, 'Ex6'];
mkdir(folderName);


arffFile = [folderName, '66train_weka32today.arff']; % THE WEKA FILE
% arffFile = [folderName, 'test_weka32.arff']; % THE WEKA FILE

PatternTypes = {'P', 'NP'}; % For the weka you can use any number of pattern types, we use 2. Initialize the pattern names here.
% P : pattern, NP: nopattern


% patternSize
patternSize = 32; % A 32x32 grid will be used.  
labels = {'RED'}; % Rm : stands for Red mean, 
                 % Rv : stands for Red variance, (these labels have to be same as in the TSSL model checker)
                 
depth = 5; % The depth of the quad tree, (if you are going to change, make sure the matlab model checker still works.)
saveImages = 1; % True: saves the images in folder "folderName/Images32new"


% parameters :
% PatternParameters.CA = 3.5;
% PatternParameters.CB = 16;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 60;


% NUMBER OF QUADTREES IN THE DATASETS
pCount = 100; % pCount quadtrees will be generated with PatternParameters.   (POSITIVE EXAMPLES)
npCount = 30; % npCount quadtrees will be generated with each of the NPparameters   (NEGATIVE EXAMPLES)
npRcount = 30; % npRcount quadtrees will be generated with random parameters  (NEGATIVE EXAMPLES)


% (POSITIVE EXAMPLES)
PatternParameters.CA = 0.2;
PatternParameters.CB = 20;
PatternParameters.dt = 0.01;
PatternParameters.T = 60;


% (NEGATIVE EXAMPLES)
NPparameters(1) = PatternParameters;
NPparameters(1).CA = 1.44;
NPparameters(1).CB = 5.27;

NPparameters(2) = PatternParameters;
NPparameters(2).CA = 1;
NPparameters(2).CB = 3;


NPparameters(3) = PatternParameters;
NPparameters(3).CA = 0.1;
NPparameters(3).CB = 1;

NPparameters(4) = PatternParameters;
NPparameters(4).CA = 0.08;
NPparameters(4).CB = 19.3;


NPparameters(4) = PatternParameters;
NPparameters(4).CA = 3;
NPparameters(4).CB = 29;


% PatternParameters.CA = 1.44;
% PatternParameters.CB = 5.27;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 60;
% 
% 
% 
% NPparameters(1) = PatternParameters;
% NPparameters(1).CA = 0.2;
% NPparameters(1).CB = 20;
% 
% NPparameters(2) = PatternParameters;
% NPparameters(2).CA = 1;
% NPparameters(2).CB = 3;
% 
% 
% NPparameters(3) = PatternParameters;
% NPparameters(3).CA = 0.1;
% NPparameters(3).CB = 1;
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 0.08;
% NPparameters(4).CB = 19.3;
% 
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 3;
% NPparameters(4).CB = 29;



% 
% % THE RUNNING EXAMPLE2:
% PatternParameters.CA = 5.6;
% PatternParameters.CB = 24.5;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 60;
% 
% 
% 
% NPparameters(1) = PatternParameters;
% NPparameters(1).CA = 0.2;
% NPparameters(1).CB = 20;
% 
% NPparameters(2) = PatternParameters;
% NPparameters(2).CA = 1;
% NPparameters(2).CB = 3;
% 
% 
% NPparameters(3) = PatternParameters;
% NPparameters(3).CA = 0.1;
% NPparameters(3).CB = 1;
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 0.08;
% NPparameters(4).CB = 19.3;
% 
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 3;
% NPparameters(4).CB = 29;



% PatternParameters.CA = 3;
% PatternParameters.CB = 29;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 100;
% 
% 
% 
% NPparameters(1) = PatternParameters;
% NPparameters(1).CA = 1;
% NPparameters(1).CB = 3;
% 
% NPparameters(2) = PatternParameters;
% NPparameters(2).CA = 5.6;
% NPparameters(2).CB =  24.5;
% 
% 
% NPparameters(3) = PatternParameters;
% NPparameters(3).CA = 0.1;
% NPparameters(3).CB = 1;
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 0.08;
% NPparameters(4).CB = 19.3;
% 
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 6;
% NPparameters(4).CB = 23;


% EX 1
% PatternParameters.CA = 1;
% PatternParameters.CB = 3;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 100;
% 
% 
% 
% NPparameters(1) = PatternParameters;
% NPparameters(1).CA = 0.2;
% NPparameters(1).CB = 20;
% 
% NPparameters(2) = PatternParameters;
% NPparameters(2).CA = 5.6;
% NPparameters(2).CB =  24.5;
% 
% 
% NPparameters(3) = PatternParameters;
% NPparameters(3).CA = 0.1;
% NPparameters(3).CB = 1;
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 0.08;
% NPparameters(4).CB = 19.3;
% 
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 6;
% NPparameters(4).CB = 23;



% THE RUNNING EXAMPLE:
% PatternParameters.CA = 5.6;
% PatternParameters.CB = 24.5;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 60;
% 
% 
% 
% NPparameters(1) = PatternParameters;
% NPparameters(1).CA = 0.2;
% NPparameters(1).CB = 20;
% 
% NPparameters(2) = PatternParameters;
% NPparameters(2).CA = 1;
% NPparameters(2).CB = 3;
% 
% 
% NPparameters(3) = PatternParameters;
% NPparameters(3).CA = 0.1;
% NPparameters(3).CB = 1;
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 0.08;
% NPparameters(4).CB = 19.3;
% 
% 
% NPparameters(4) = PatternParameters;
% NPparameters(4).CA = 6;
% NPparameters(4).CB = 23;



% random parameters:

Rparam = PatternParameters;

% SIMULATE SYSTEM AND SAVE IMAGES
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


% create the arfffile 
A = rand(patternSize);
tree= cell(1);
tree{1} = calculateQuadtree(A);
% tree{1} = tree{1}/tree{1}(1,1);

saveARFFTree(arffFile, tree, 0, labels, PatternTypes, depth);
tic
for i=1:pCount
    
    A = TuringSimulation(patternSize, PatternParameters, false);
    if(saveImages)
        im(:,:,1) = A;
        imwrite(im, [imageFolder, 'PATTERN ', num2str(i), '.png'],'png');
    end
    tree{1} = calculateQuadtree(A); 
  %   tree{1} = tree{1}/tree{1}(1,1);
    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
    if(rem(i,500) == 0)
        i
    end
end
toc




for i=1:length(NPparameters)
    i
    for j=1:npCount
         A = TuringSimulation(patternSize, NPparameters(i), false);
         tree{1} = calculateQuadtree(A);
     %    tree{1} = tree{1}/tree{1}(1,1);
        saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
        if(saveImages)
            im(:,:,1) = A;
            imwrite(im, [imageFolder, 'NP_', num2str(i), '_', num2str(j), '.png'],'png');
        end
    end
    
end


count = 0;
uniCount = 0;

rp = 0.4;
while(1)
    
    
    while(1)
        Rparam.CA = rand()*30;
        Rparam.CB = rand()*30;
        if (Rparam.CA > PatternParameters.CA*(1-rp) && Rparam.CA < PatternParameters.CA*(1+rp) ...
                && Rparam.CB > PatternParameters.CB*(1-rp) && Rparam.CB <  PatternParameters.CB*(1+rp))
            Rparam.CA = rand()*30;
            Rparam.CB = rand()*30;
        else
            break;
        end
    end
    
    A = TuringSimulation(patternSize, Rparam, false);
    check = sum(sum(A)) >= patternSize*patternSize*0.95;

    if(check && uniCount > npRcount*0.1)
        continue;
    end
    if(check)
        uniCount = uniCount + 1;
    end
    
    count = count + 1;
    tree{1} = calculateQuadtree(A);
  %  tree{1} = tree{1}/tree{1}(1,1);
    if(saveImages)
        im(:,:,1) = A;
        imwrite(im, [imageFolder, 'NP_R_', num2str(j),'_', num2str(Rparam.CA), '_', num2str(Rparam.CB) '.png'],'png');
    end
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    
    if(count >= npRcount)
        break;
    end
end
