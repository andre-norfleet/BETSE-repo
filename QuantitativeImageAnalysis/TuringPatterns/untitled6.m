


% test script: 

folderName = '/Users/ebru/Desktop/TuringDataSet/';


formulaFile = [folderName, 'formula.txt'];
depth = 5;

folderName = [folderName, 'JavaOptimization/test1/'];


formula = getFormula(formulaFile, 2^(depth)*2^(depth));

imageNames = dir(folderName);

Alltrees = cell(length(imageNames),1);

for i=1:length(imageNames)
   
    if(imageNames(i).name(1) ~= 'T' || imageNames(i).name(end) ~= 'g')
        continue;
    end
        
    fname = [folderName, imageNames(i).name];
     imO = imread(fname, 'png');
    treeM = cell(2,1);
    
    for j=1:2
        
        treeM{j} = calculateQuadtree(double(imO(:,:,j))/255);
        
        % normalize the tree:
        treeM{j} = treeM{j}/treeM{j}(1,1);
        
    end
    Alltrees{i} = treeM;
    
    fprintf('%s %.24f\n', imageNames(i).name, modelCheckPatternDiscount(formula, treeM, 'P '));
    
    
end

