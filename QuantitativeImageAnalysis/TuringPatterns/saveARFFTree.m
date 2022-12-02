% fileName : the name of the WEKA file
% treeM : a quadtre
% append is true, then append the tree to the file according to the rff
% representation, i.e. add a line to the arff file
% append is false, create the arff file , write the attributes
% labels: the labels for the tree, e.g. labels = {'Rm', 'Rv'};
% P : pattern types, e.g P = {P, NP}


function saveARFFTree(fileName, treeM, append, labels,P, depth)

    %load('testtree1.mat','tree');
    %treeM = {};
    tree = treeM{1};
	[d, s] = size(tree);
    if(depth > d)
        depth = d;
    end
    

    %filename = 'Z:\Andre\2021 BETSE Sim Output\Norm111Ex101BETSE1018train_weka32today.arff';
    filename = fileName;
    
    children = '1234';
    if(~append) % create file
        %filename = arffFile;
        fileID  = fopen(filename, 'w');



        fprintf(fileID, '% information about the pattern \n');


        fprintf(fileID, '@relation pattern-tree\n\n'); 

        % write the attributes:
 
        % stack 
        myStack = {'1'};
        myStackN = {};
        
        for di=1:depth
            % pop from the stack
            while(~isempty(myStack))
                base = myStack{1}; % read the first
                myStack(1) = [];  % delete it (pop)
                
                for l=1:length(labels)
                    fprintf(fileID, [ '@attribute n_' , base , '_',labels{l}, ' real\n']);
                end
                if(di ~= depth)
                    for j=1:4
                        myStackN = [myStackN, [base, children(j)]];
                    end
                end
            end
            myStack = myStackN;
            myStackN = {};
        end

        fprintf(fileID,['@attribute pattern {', P{1}]);
        for i=2:length(P)
            fprintf(fileID,[',' P{i}]);
        end   
        fprintf(fileID, '}\n');
        %fprintf(fileID,'@attribute pattern {yes,no}');
        fprintf(fileID,'\n@data\n\n');

        
        
    else
        fileID  = fopen(fileName, 'a');

        step = s;
        s1 = length(treeM); %treeM designator
        
        for di=1:depth
           s2 = s/step;
           psAll = zeros(s1, s2); % number of chanels, number of children in this level
           for mi=1:length(treeM) %treeM designator
                psAll(mi,:) = treeM{mi}(di, 1:step:end); %treeM designator
           end
           
           for pi=1:s2
               for pj = 1:s1
                    fprintf(fileID, '%f,', psAll(pj,pi));
               end
           end
           step = int16(step/4);
        end
        fprintf(fileID, [P, '\n']);
       
        
    end
    
    fclose(fileID);
    
end

