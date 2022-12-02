

% state space:




CArange = [1:1:30];
CBrange = [1:1:30];






folderName = '/Users/ebru/Desktop/TuringDataSet/PATTERNEXAMPLES_VARIANCE/Ex1Running/';


formulaFile = [folderName, 'formulaweka'];
depth = 5;

% folderName = [folderName, 'JavaOptimization/test1/'];


formula = getFormulaVariance(formulaFile, 2^(depth)*2^(depth));


param.CA = 0;
param.CB = 0;
param.dt = 0.01 ;
param.T = 100;

RESULTS = zeros(length(CArange),length(CBrange));

cc = 2;
parfor a=1:length(CArange)
    for i=1:cc
        RESULTS(a,:) = RESULTS(a,:) + evaluateParamSet(CArange(a), CBrange, 32, formula, 0.01 ,60);
    end
    RESULTS(a,:) = RESULTS(a,:)/cc;
        a
end


save([folderName, 'formula_stateSpace'], 'RESULTS', 'CArange', 'CBrange');
% for a=1:length(CArange)
%     param.CA = CArange(a);
%     for b=1:length(CBrange)
%        param.CB = CBrange(b);
%        A = TuringSimulation(128, param, false);
%        tree{1} = calculateQuadtree(A);
%        tree{1} = tree{1}/tree{1}(1,1);
%        RESULTS(a,b) = modelCheckPattern(formula, tree, 'P ');
%    end
% end



surf(CBrange, CArange(1:10), RESULTS(1:10, :))
xlabel('cb');
ylabel('ca');

figure;
surf(CBrange, CArange, RESULTS)
xlabel('cb');
ylabel('ca');

param.CA = 5.6;
param.CB = 24.5;

param.CA = 3;
param.CB = 0;

       A = TuringSimulation(32, param, true);
       [ tree{1} , tree{2} ] = calculateQuadtree(A);
       modelCheckPattern(formula, tree, 'P ')

