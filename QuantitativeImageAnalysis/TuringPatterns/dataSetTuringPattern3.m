

close all;

% turing pattern dataset

folderName = '/Users/ebru/Desktop/TuringDataSet/PATTERNEXAMPLES/';
mkdir(folderName);
folderName = [folderName, 'Ex4/'];
mkdir(folderName);


arffFile = [folderName, 'test_weka32.arff'];
PatternTypes = {'P', 'NP'};

% patternSize
patternSize = 32;
labels = {'RED'};
depth = 5;
saveImages = false;


% parameters :
% PatternParameters.CA = 3.5;
% PatternParameters.CB = 16;
% PatternParameters.dt = 0.01;
% PatternParameters.T = 60;


pCount = 4000;
npCount = 500; % for each x 4
npRcount = 2000;

PatternParameters.CA = 1.44;
PatternParameters.CB = 5.27;
PatternParameters.dt = 0.01;
PatternParameters.T = 60;



NPparameters(1) = PatternParameters;
NPparameters(1).CA = 0.2;
NPparameters(1).CB = 20;

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

if(saveImages)
    imageFolder = [folderName, 'Images32new/'];
    mkdir(imageFolder);


    im = zeros(patternSize, patternSize, 3);
    % plot all:
    im(:,:,1) = TuringSimulation(patternSize, PatternParameters, false);
    im(:,:,1) = im(:,:,1)/max(max(im(:,:,1)));
    imwrite(im, [imageFolder, 'PATTERN', '.png'],'png');

    for i=1:length(NPparameters)
        im(:,:,1) = TuringSimulation(patternSize, NPparameters(i), false);
        im(:,:,1) = im(:,:,1)/max(max(im(:,:,1)));
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
