

close all;

resultsFolder= '/Users/ebru/Desktop/TuringDataSet/PATTERN32VARIANCE/';
resultsFile = [ resultsFolder, 'formula_stateSpaceAvg100'];
mkdir(resultsFile);

resultsFolder = [resultsFile, '/'];



R = load(resultsFile);

resultsFile = [resultsFolder, 'SP'];


figure;
surf(R.CBrange, R.CArange, R.RESULTS)
xlabel('Dy');
ylabel('Dx');
saveas(gcf, [resultsFile , '_st'], 'fig');
saveas(gcf, [resultsFile , '_st'], 'pdf');
saveas(gcf, [resultsFile , '_st'], 'png');



alim = find(R.CArange >= 8,1);
if(isempty(alim))
    alim = length(R.CArange);
end


figure;
surf(R.CBrange, R.CArange(1:alim), R.RESULTS(1:alim,:))
xlabel('Dy');
ylabel('Dx');

saveas(gcf, [resultsFile , '_z'], 'fig');
saveas(gcf, [resultsFile , '_z'], 'pdf');
saveas(gcf, [resultsFile , '_z'], 'png');

% smoothR = smoothts(R.RESULTS);
 
kernel = [0 1 0 ; 1 4 1 ; 0 1 0];
kernel = kernel/sum(sum(kernel));


smoothR = R.RESULTS(1:alim, :);

for i=1:10
    smoothR = [smoothR(1,:); smoothR];
    smoothR = [smoothR; smoothR(end,:)];
    smoothR  = [smoothR(:,1), smoothR ];
    smoothR  = [smoothR, smoothR(:,end) ];
    

        
    smoothR = conv2(smoothR, kernel, 'valid');

    % smoothR = smooth2(R.RESULTS(1:alim, :));

    figure;
    surf(R.CBrange, R.CArange(1:alim), smoothR)
    xlabel('Dy');
    ylabel('Dx');
    saveas(gcf, [resultsFile , '_zs', num2str(i)], 'fig');
    saveas(gcf, [resultsFile , '_zs', num2str(i)], 'pdf');
    saveas(gcf, [resultsFile , '_zs', num2str(i)], 'png');
    title(num2str(i))
    
end

