

function analyzeParticles(folderName, p)


    figure;
    hold on;
    
    plot(p(1), p(2), '.', 'color', 'r', 'markersize', 20);
    
    pcolor = [0.9,0.9,0.9];
    for i=0:1:200
        
       A = load([folderName, 'particles', num2str(i), '.txt']);
       
       plot(A(:,1)/6, A(:,2)/6, '.', 'color', pcolor*i/201);
       drawnow;
       
        
    end
    plot(p(1), p(2), '.', 'color', 'r', 'markersize', 20);

    fid = fopen([folderName, 'parameterSet']);
    for i=1:length(p)
        S = fgetl(fid);
        n = find(S >= '0');
        n2 = find(S <= '9');
        
        n = intersect(n,n2);
        n = min(n);
        
        p(i) = str2double(S(n:end)); 
        
    end
    plot(p(1), p(2), '.', 'color', 'b', 'markersize', 20);
    fclose(fid);
    
end