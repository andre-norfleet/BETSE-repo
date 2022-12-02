

function R = evaluateParamSet(CA, CBrange, ps, formula, dt ,T)

    param.dt = dt;
    param.T = T;
    param.CA = CA;
    
    R = zeros(1, length(CBrange));
    
    tree = cell(1,1);
    for i=1:length(CBrange)
       
        
        param.CB = CBrange(i);
        A = TuringSimulation(ps, param, false);
        [ tree{1} , tree{2} ] = calculateQuadtree(A);
        
        % tree{1} = tree{1}/tree{1}(1,1);
        R(i) = modelCheckPattern(formula, tree, 'P ');
        
    end
    
end