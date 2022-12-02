testName = 'C:\Users\USER\Desktop\matlab_pattern_set\normalizeRootTrainTestRobustnessCheck';

mkdir(testName);

formulaFile = 'C:\Users\USER\Desktop\matlab_pattern_set\normalizeRootTrainTest\formula.txt';

testName = [testName, '\'];

arffFile = [testName, 'test_weka.arff'];

negativeimagefolder2 = 'Z:\Andre\2021 BETSE Sim Output\K10supp1';
listing = dir(negativeimagefolder2);
len=length(listing);
ind = [];
for ii = 1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end

listing = listing(ind);
len= length(listing);
negimageset2 = zeros(1,len);
for ii=1:len
    names = listing(ii).name;
    neg2filename = fullfile(negativeimagefolder2,names);
    negdata2=imread(neg2filename);
    negdata2=imageTrim(negdata2,2);
    negdata2=make32(negdata2);
    negdata2=double(negdata2(:,:,1));
    negdata2=negdata2./max(max(negdata2));
end

% filenameS = {'pattern1.png', 'pattern2.png', 'pattern3.png', 'np1.png', 'np2.png', 'np3.png','np4.png','np5.png','np6.png'};
% pmap = [1,2,3,ones(1,6)*4]; % pattern mappings
% PatternTypes = {'P1','P2','P3', 'NP'};
% Nset = [ ones(1,3)*10, ones(1,6)*2];


labels = {'RED', 'GREEN'};


patternSize = 64;
firstP = 1;
depth = 5;
mycolor_map = zeros(128,3);
for j=1:3
    mycolor_map(:,j) = linspace(1.0,0.0,128);
end

filterTypes = {'average','disk','gaussian','motion'};
filterSet = cell(length(filterTypes),1);
filterSet{1} = fspecial('average',100);
filterSet{2} =  fspecial('disk',8);
filterSet{3} =  fspecial('gaussian',10, 0.9);
filterSet{4} =  fspecial('motion',50, 60);



    for(t = 1:length(filterTypes))
        filterSet{t} =fspecial(filterTypes{t},10);
        
    end
    

count = 1;
saveImages = true;

loadImage = false;
formulaCheck = true;
ConfusionMatrix = zeros(length(PatternTypes));
if(formulaCheck)
    formula = getFormula(formulaFile, 2^(depth)*2^(depth));
end

patternIndex = 0;

for p=1:length(filenameS)
    p
    pat = PatternTypes{pmap(p)};
    patternIndex  = pmap(p);
    % rotate , a random angle, position , generate tree, store,

    imO = imread(filenameS{p}, 'png');

    imO(1,:,:) = [];
    imO(end,:,:) = [];
    imO(:,1,:) = [];
    imO(:,end,:) = [];

     
    [s1,s2, c] = size(imO);
        imM = zeros(patternSize,patternSize,c);
        treeM = cell(2,1);
        
    for n=1:Nset(p)
        
        
 
        if(n == 0.9*Nset(p))
            imO = imfilter(imO, filterSet{2}, 'replicate');
            pat = PatternTypes{4};
            patternIndex = 4;
        end
        fname = [testName, 'pattern_', num2str(p) ,'_', pat, '_', num2str(n)];

        if(loadImage) 
            imM = imread([fname, '.png']);
        else
            done = false;
            while(~done)

                ang = rand*360;

                im = imrotate(imO,ang, 'bilinear', 'crop');


          %      loc(1) = randi([abs(int16(s1*cos(ang)/2)),  s1 - abs(int16(s1*sin(ang)/2)) - patternSize],1,1); % start point
          %      loc(2) = randi([abs(int16(s2*cos(ang)/2)),  s2 - abs(int16(s2*sin(ang)/2))-patternSize],1,1); % start point

                loc(1) = randi([1, s1 - patternSize],1,1);
                loc(2) = randi([1, s2 - patternSize],1,1);

                imM = im(loc(1):loc(1)+patternSize-1,loc(2):loc(2)+patternSize-1, :);
                if(isempty(find(imM == 0, 1)) || p > 3)
                    done = true;
                else
                    % fprintf('try again, count %d\n', count);
                    count = count +1 ;
                end
            end
            if(saveImages)
                imwrite(imM, [fname, '.png'],'png');
            end
        end
        for i=1:2
            % imM{i} = double(im(loc(1):loc(1)+patternSize-1,loc(2):loc(2)+patternSize-1, i))/255;
            
            treeM{i} = calculateQuadtree(double(imM(:,:,i))/255);
            
            % normalize the tree: 
            treeM{i} = treeM{i}/treeM{i}(1,1);
            
%             figure;
%             imagesc(treeM{i});
%             colormap(mycolor_map)
%             saveas(gcf, [testName, 'tree_P' , num2str(p), '_', num2str(n), '_C', num2str(i),'.png'], 'png');


        end


        if(~loadImage)
            if(firstP)
                saveARFFTree(arffFile, treeM, 0, labels, PatternTypes, depth);
                firstP = 0;
            end
            saveARFFTree(arffFile, treeM, 1,labels, pat, depth );
        end
       % imshow(imM);
       if(formulaCheck)
        fileID = fopen([fname,'.txt'] , 'w');
        MCR = zeros(length(PatternTypes),1);
        for ti=1:length(PatternTypes)
            tpat = PatternTypes{ti};
            MCR(ti) = modelCheckPattern(formula, treeM, tpat);
            fprintf(fileID, '%s %f\n',tpat,  MCR(ti));
        end
        title(MCR);
        ConfusionMatrix(patternIndex, MCR > 0) = ConfusionMatrix(patternIndex, MCR > 0) + 1;
        fclose(fileID);
    
    
       end
        
        
        if(rem(n,100) == 0)
            n
        end
    end
    
end