

% read the stateSpace-fitness data,
% for each Dy , choose Dx that maximizes the fitness, 
%       then simulate the system with these parameters, compute the
%       robustness, compute how close this robustness to the the data (that was averaged)
%       plot the results





close all;

resultsFolder= '/Users/ebru/Desktop/TuringDataSet/PATTERN32VARIANCE/';
% read the formula
formulaFile = [resultsFolder, 'formula.txt'];
depth = 5;
formula = getFormulaVariance(formulaFile, 2^(depth)*2^(depth));

resultsFile = [ resultsFolder, 'formula_stateSpaceAvg100'];

R = load(resultsFile);

resultsFolder = [resultsFile, 'set2/'];
mkdir(resultsFile);


resultsFile = [resultsFolder, 'An_'];

figure;
surf(R.CBrange, R.CArange, R.RESULTS)
xlabel('Dy');
ylabel('Dx');


params.CA = 5.6;
params.CB = 24.5;
params.dt = 0.01;
params.T = 60;


tree = cell(2,1);
D = zeros(1, length(R.CBrange));
for i=1:length(R.CBrange)
   
    params.CB = R.CBrange(i);
    [ r, DxI ] = max( R.RESULTS(:, i));
    params.CA = R.CArange(DxI);
    
    A = TuringSimulation(32, params, true);
    [ tree{1} , tree{2} ] = calculateQuadtree(A);
    rm = modelCheckPattern(formula, tree, 'P ');
    
    title(['r = ', num2str(rm), ' avg,r =', num2str(r), '  Dx = ', num2str(params.CA), ' Dy = ', num2str(params.CB)]);
    saveas(gcf, [resultsFile, num2str(i)], 'png');
    
    D(i) = abs(r - rm);
    
    close all;
    
end



[l1, i1] = max(R.RESULTS);
[l2, i2] = max(l1);

CAi = i1(i2);
CBi = i2;

CA_best = R.CArange(CAi);
CB_best = R.CBrange(CBi);

fprintf('OPT fitness = %f,  CA = %f, CB=%f \n', R.RESULTS(CAi,CBi), R.CArange(CAi), R.CBrange(CBi));




