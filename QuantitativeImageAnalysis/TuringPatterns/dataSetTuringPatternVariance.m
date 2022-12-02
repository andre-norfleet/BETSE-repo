% GENERATING DATA SETS WITH MEAN AND THE VARIANCE FROM THE SIMPLE TURING SYSTEM:


close all;

% turing pattern dataset

folderName = '/Users/ebru/Desktop/TuringDataSet/PATTERNEXAMPLES_VARIANCE/';
mkdir(folderName);
folderName = [folderName, 'Ex2/'];
mkdir(folderName);

arffFile = [folderName, 'test_weka32.arff'];
PatternTypes = {'P', 'NP'};

% patternSize
% patternSize
patternSize = 32;
labels = {'Rm', 'Rv'};
depth = 5;
saveImages = false;

pCount = 4000/2;
npCount = 500/2; % for each x 4
npRcount = 2000/2;

% % % for images:
% pCount = 40;
% npCount = 5; % for each x 4
% npRcount = 20;


% Ex1 : Running Example 
% PatternParameters.CA = 5.6;
% PatternParameters.CB = 24.5;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 120;
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
% NPparameters(4).CA = 1.4;
% NPparameters(4).CB = 5.3;



% EX 2
PatternParameters.CA = 1;
PatternParameters.CB = 3;
PatternParameters.dt = 0.01;
PatternParameters.T = 120;



NPparameters(1) = PatternParameters;
NPparameters(1).CA = 0.2;
NPparameters(1).CB = 20;

NPparameters(2) = PatternParameters;
NPparameters(2).CA = 5.6;
NPparameters(2).CB =  24.5;


NPparameters(3) = PatternParameters;
NPparameters(3).CA = 0.1;
NPparameters(3).CB = 1;

NPparameters(4) = PatternParameters;
NPparameters(4).CA = 0.08;
NPparameters(4).CB = 19.3;


NPparameters(4) = PatternParameters;
NPparameters(4).CA = 6;
NPparameters(4).CB = 23;
% 


% random parameters:

Rparam = PatternParameters;

if(saveImages)
    imageFolder = [folderName, 'Images32/'];
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


% % % % % % % % % % 
% create the arfffile 
A = rand(patternSize);
tree= cell(2);
[ tree{1}, tree{2}]   = calculateQuadtree(A);
% tree{1} = tree{1}/tree{1}(1,1);

saveARFFTree(arffFile, tree, 0, labels, PatternTypes, depth);
tic
for i=1:pCount
    
    A = TuringSimulation(patternSize, PatternParameters, false);
    if(saveImages)
        im(:,:,1) = A;
        imwrite(im, [imageFolder, 'PATTERN ', num2str(i), '.png'],'png');
    end
    [ tree{1}, tree{2}] = calculateQuadtree(A);
    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
end
toc




for i=1:length(NPparameters)
    i
    tic
    for j=1:npCount
         A = TuringSimulation(patternSize, NPparameters(i), false);
        [ tree{1}, tree{2}] = calculateQuadtree(A);
     %    tree{1} = tree{1}/tree{1}(1,1);
        saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
        if(saveImages)
            im(:,:,1) = A;
            imwrite(im, [imageFolder, 'NP_', num2str(i), '_', num2str(j), '.png'],'png');
        end
    end
    toc
end


count = 0;
uniCount = 0;

rp = 0.4;
 tic
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
    [ tree{1}, tree{2}] = calculateQuadtree(A);
  %  tree{1} = tree{1}/tree{1}(1,1);
    if(saveImages)
        im(:,:,1) = A;
        imwrite(im, [imageFolder, 'NP_R_', num2str(j),'_', num2str(Rparam.CA), '_', num2str(Rparam.CB) '.png'],'png');
    end
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    
    if(count >= npRcount)
        break;
    end
    if(rem(count, 100) == 0)
        count
        toc
    end
end