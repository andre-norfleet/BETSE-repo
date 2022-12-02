%[num,txt,raw] = xlsread('167Dthtestoutput33.xlsx');
scoresinput = readtable('167Dthtestoutput33.xlsx','Range', 'A1:B10', 'ReadVariableNames',false);

outputFile3 = 'Z:\Andre\Code\TuringPatterns\169Gthtestoutput33.xlsx';
len = height(scoresinput);

for ii=1:len
    txt2(ii,1) = scoresinput{ii,2};
    sampInd1 = strfind(txt2, 'amp');
    sampInd2 = strfind(txt2, '.png');
    arrayInd1(ii) = sampInd1{ii,1};
    arrayInd2(ii) = sampInd2{ii,1};
    b{ii,1} = txt2{ii,1};
    %dee = b{1,ii}; 
    btranspose = b.';
    %numberOut(ii,2) = btranspose{ii,1}(arrayInd1+3:arrayInd2-1);
    numberOut(ii,2) = b{ii,1}(arrayInd1+3:arrayInd2-1);
    numberOut2 = str2num(numberOut);
    %writematrix(arrayInd1, outputFile3, 'Sheet',1,'Range','A1:B10');
end

arrayInd1tr = arrayInd1.';
writematrix(arrayInd1tr, outputFile3, 'Sheet',1,'Range','A1:A10');
writematrix(numberOut2, outputFile3, 'Sheet',1,'Range','C1:C10');


