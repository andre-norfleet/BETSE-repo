

% improve the dataset :
folderName = '/Users/ebru/Desktop/TuringDataSet/PATTERNEXAMPLES/Ex4_SS/';

arffFile = [folderName, 'train_add1_weka32.arff'];

param.CA = 6.583333;
param.CB = 9.916667;
param.dt = 0.01;
param.T = 60;

%6.583333
%CB	9.916667

% patternSize
patternSize = 32;
labels = {'RED'};
depth = 5;
npCount = 250;

% CA	3.75
% CB	28.75
% 
for i=1:npCount
    A = TuringSimulation(patternSize, param, false);
    tree{1} = calculateQuadtree(A);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    i
end


% % % % % % % % % % % 
% % % % % % % CA	3.75
% % % % % % % CB	28.75
% % % % % % param.CA = 3.75;
% % % % % % param.CB = 28.75;
% % % % % % param.dt = 0.01;
% % % % % % param.T = 60;
% % % % % % folderName = '/Users/ebru/Desktop/TuringDataSet/PATTERN32/';
% % % % % % formulaFile = [folderName, 'formulaadd.txt'];
% % % % % % depth = 5;
% % % % % % 
% % % % % % formula = getFormula(formulaFile, 2^(depth)*2^(depth));
% % % % % % 
% % % % % % 
% % % % % % for i=1:5
% % % % % %     A = TuringSimulation(patternSize, param, true);
% % % % % %     tree{1} = calculateQuadtree(A);
% % % % % %     tree{1} = tree{1}/tree{1}(1,1);
% % % % % %     modelCheckPattern(formula, tree, 'P ')
% % % % % % end
% % % % % % 
% % % % % % 
% % % % % % PatternParameters.CA = 5.6;
% % % % % % PatternParameters.CB = 24.5;
% % % % % % PatternParameters.dt = 0.01;
% % % % % % PatternParameters.T = 60;
% % % % % % 
% % % % % % 
% % % % % % for i=1:5
% % % % % %     A = TuringSimulation(patternSize, PatternParameters, true);
% % % % % %     tree{1} = calculateQuadtree(A);
% % % % % %     tree{1} = tree{1}/tree{1}(1,1);
% % % % % %     modelCheckPattern(formula, tree, 'P ')
% % % % % % end

% folderName = [folderName, 'JavaOptimization/test1/'];


