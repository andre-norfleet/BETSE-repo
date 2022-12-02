


function formula = getFormula(fileName, L)

    fileName = 'BETSE10mmKsupp5Autoscaleformula.txt';
    L = 1024;

    dotInd = find(fileName== 'BETSE10mmKsupp5Autoscaleformula.txt');
    outFile = fileName(1:dotInd(end)-1);

    fid = fopen(fileName);
    
    
    formula = cell(0,2); % 
    ind = 1;
    while( ~feof(fid) )
         
        line = fgetl(fid);
        andIndex = strfind(line, 'and');
        
        
        R = [];
        
        if(length(strfind(line, '('))>1 )
            andIndex = [1 andIndex length(line)];

            for j=1:length(andIndex)-1
                exp = line(andIndex(j):andIndex(j+1)-1);
                R(j,:) =  getExpression(exp, L);
            end
        end
        % the pattern
        ptI = strfind(line, 'pattern');
        pt = line(ptI+8:ptI+9);
        formula{ind, 1} = R;
        formula{ind, 2} = pt;
        ind = ind +1 ;
    end
    fclose(fid);


end


function result = getExpression(str, L)

    % str = (n_11124_RED >= 0.201961) and 
    
    result = zeros(5,1);
    
    % first get formula :
    p1 = strfind(str, '(');
    p2 = strfind(str, ')');
    
    str = str(p1+1:p2-1); % (n_11124_RED >= 0.201961)
    
    underscoreInd = strfind(str, '_');
    
    treePath = str(underscoreInd(1)+1:underscoreInd(2)-1); % 11124
    
    depth = length(treePath); % the depth
    index = 1;
    div = L ; 
    for i=1:depth
        index = index + (str2num(treePath(i)) - 1)*div;
        div = div/4;  
    end
     
    whiteSpace = strfind(str, ' ');
    colorChar = str(underscoreInd(2)+1);
    color = 0;
    
    if(colorChar == 'R' || colorChar == 'r')
        color = 1;
    end
    if(colorChar == 'G' || colorChar == 'g')
        color = 2;
    end   
    if(colorChar == 'B' || colorChar == 'b')
        color = 3;
    end    
    
    
    bound = str2double(str(whiteSpace(2):end));
    exp = str(whiteSpace(1)+1); % > or <
    
    result(1) = color;
    result(2) = depth;
    result(3) = index;
    result(4) = bound;
    result(5) = exp;
end




