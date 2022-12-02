% GENERATING DATA SETS FROM THE HEXAGONAL LOBULE SYSTEM:
% 
close all;

% turing pattern dataset

folderName = 'Z:\Andre\2021 BETSE Sim Output\Norm109';
mkdir(folderName);
folderName = [folderName, 'Ex99BETSE'];
mkdir(folderName);


arffFile = [folderName, '998train_weka32today.arff']; % THE WEKA FILE
% arffFile = [folderName, 'test_weka32.arff']; % THE WEKA FILE
filename = 'Z:/Andre/2021 BETSE Output/Norm109/998train_weka32today.arff';

PatternTypes = {'P', 'NP'}; % For the weka you can use any number of pattern types, we use 2. Initialize the pattern names here.
% P : pattern, NP: nopattern


% patternSize
patternSize = 32; % A 32x32 grid will be used.  
labels = {'Bm','Bv'}; % Rm : stands for Red mean, 
                 % Rv : stands for Red variance, (these labels have to be same as in the TSSL model checker)
                 
depth = 5; % The depth of the quad tree, (if you are going to change, make sure the matlab model checker still works.)
saveImages = 1; % True: saves the images in folder "folderName/Images32new"


%imageset=cell(1,10);
%for i = 1:10
%imageset{i}=imread(sprintf('samp%d.png',i));
%data{i}=imageTrim(imageset{i},2);
%data{i} = make32(data{i});
%data{i} = double(data{i}(:,:,1));
%data{i} = data{i}./max(max(data{i}));
%redimageset{i} = data{1,i}(:,:,1);
%end


% create the arfffile 
A = rand(patternSize);
tree = cell(1);
tree{1} = calculateQuadtree(A);
%tree{1} = tree{1}/tree{1}(1,1);

saveARFFTree(arffFile, tree, 0, labels, PatternTypes, depth);

%for i = 1:10
  %  tree{1} = calculateQuadtree(redimageset{i}); 
  %   tree{1} = tree{1}/tree{1}(1,1);
 %   saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    %if(rem(i,500) == 0)
    %    i
%end

positiveimagefolder1 = 'Z:\Andre\BeltaWeisscollab\ctrlrepset1';
listing = dir(positiveimagefolder1);
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
posimageset1 = zeros(1,len);
for ii=1:len
    names = listing(ii).name;
    pos1filename = fullfile(positiveimagefolder1,names);
    posdata1=imread(pos1filename);
    %posdata1=posdata1(200:800,100:700,:); % trial run
    %posdata1=imageTrim(posdata1,2); % trial run
    posdata1=make32(posdata1);
    posdata1=double(posdata1(:,:,3)); %Determines which dim of RGB trip to analyze
    posdata1=posdata1./max(max(posdata1));
    d=log2(size(posdata1,1)); % 5 30 22 trial
    [tree{1}, tree{2}] = calculateQuadtree(posdata1); % 5 30 22 trial
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
end

negativeimagefolder1 = 'Z:\Andre\BeltaWeisscollab\radialset1';
listing = dir(negativeimagefolder1);
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
negimageset1 = zeros(1,len);
for ii=1:len
    names = listing(ii).name;
    neg1filename = fullfile(negativeimagefolder1,names);
    negdata1=imread(neg1filename);
    %negdata1=negdata1(200:800,100:700,:); % trial run
    %negdata1=imageTrim(negdata1,2); % trial run
    negdata1=make32(negdata1);
    negdata1=double(negdata1(:,:,3)); %Color chann control
    negdata1=negdata1./max(max(negdata1));
    d=log2(size(negdata1,1)); % 5 30 22 trial
    [tree{1}, tree{2}] = calculateQuadtree(negdata1); % 5 30 22 trial
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
end

negativeimagefolder2 = 'Z:\Andre\BeltaWeisscollab\sinusoidalset1';
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
    %negdata2=negdata2(200:800,100:700,:);
    %negdata2=imageTrim(negdata2,2);
    negdata2=make32(negdata2);
    negdata2=double(negdata2(:,:,3)); %Color chann control
    negdata2=negdata2./max(max(negdata2));
    d=log2(size(negdata2,1)); % 5 30 22 trial
    [tree{1}, tree{2}] = calculateQuadtree(negdata2); % 5 30 22 trial
    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
end

%negativeimagefolder3 = 'Z:\Andre\2021 BETSE Sim Output\K10supp1Autoscale';
%listing = dir(negativeimagefolder3);
%len=length(listing);
%ind = [];
%for ii = 1:len
%    names=listing(ii).name;
%    if length(names)>=5 && all(names((end-2):end)=='png')
%        ind=[ind ii];
%    end
%end

%listing = listing(ind);
%len= length(listing);
%negimageset3 = zeros(1,len);
%for ii=1:len
%    names = listing(ii).name;
%    neg3filename = fullfile(negativeimagefolder3,names);
%    negdata3=imread(neg3filename);
%    negdata3=negdata3(200:800,100:700,:);
%    negdata3=imageTrim(negdata3,2);
%    negdata3=make32(negdata3);
%    negdata3=double(negdata3(:,:,1));
%    negdata3=negdata3./max(max(negdata3));
%    d=log2(size(negdata3,1)); % 5 30 22 trial
%    [tree{1}, tree{2}] = calculateQuadtree(negdata3); % 5 30 22 trial
%    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
%end

%negativeimagefolder4 = 'Z:\Andre\2021 BETSE Sim Output\GJ5050MosaicAutoscale2';
%listing = dir(negativeimagefolder4);
%len=length(listing);
%ind = [];
%for ii = 1:len
%    names=listing(ii).name;
%    if length(names)>=5 && all(names((end-2):end)=='png')
%        ind=[ind ii];
%    end
%end

%listing = listing(ind);
%len= length(listing);
%negimageset4 = zeros(1,len);
%for ii=1:len
%    names = listing(ii).name;
%    neg4filename = fullfile(negativeimagefolder4,names);
%    negdata4=imread(neg4filename);
    %negdata4 = imrotate(negdata4,90,'bilinear','crop');
%    negdata4=negdata4(200:800,100:700,:);
%    negdata4=imageTrim(negdata4,2);
%    negdata4=make32(negdata4);
%    negdata4=double(negdata4(:,:,1));
%    negdata4=negdata4./max(max(negdata4));
%    d=log2(size(negdata4,1)); % 5 30 22 trial
%    [tree{1}, tree{2}] = calculateQuadtree(negdata4); % 5 30 22 trial
%    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
%end

%negativeimagefolder6 = 'Z:\Andre\2021 BETSE Sim Output\GJbetaGA75decAutoscale';
%listing = dir(negativeimagefolder6);
%len=length(listing);
%ind = [];
%for ii = 1:len
%    names=listing(ii).name;
%    if length(names)>=5 && all(names((end-2):end)=='png')
%        ind=[ind ii];
%    end
%end

%listing = listing(ind);
%len= length(listing);
%negimageset6 = zeros(1,len);
%for ii=1:len
%    names = listing(ii).name;
%    neg6filename = fullfile(negativeimagefolder6,names);
%    negdata6=imread(neg6filename);
    %negdata6 =imrotate(negdata6,180,'bilinear','crop');
%    negdata6=negdata6(200:800,100:700,:);
%    negdata6=imageTrim(negdata6,2);
%    negdata6=make32(negdata6);
%    negdata6=double(negdata6(:,:,1));
%    negdata6=negdata6./max(max(negdata6));
%    d=log2(size(negdata6,1)); % 5 30 22 trial
%    [tree{1}, tree{2}] = calculateQuadtree(negdata6); % 5 30 22 trial
%    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
%end

% Pattern Set 5

%negativeimagefolder5 = 'Z:\Andre\2021 BETSE Sim Output\GJBlock100percentAutoscale';
%listing = dir(negativeimagefolder5);
%len=length(listing);
%ind = [];
%for ii = 1:len
%    names=listing(ii).name;
%    if length(names)>=5 && all(names((end-2):end)=='png')
%        ind=[ind ii];
%    end
%end

%listing = listing(ind);
%len= length(listing);
%negimageset5 = zeros(1,len);
%for ii=1:len
%    names = listing(ii).name;
%    neg5filename = fullfile(negativeimagefolder5,names);
%    negdata5=imread(neg5filename);
%    negdata5=negdata5(200:800,100:700,:);
%    negdata5=imageTrim(negdata5,2);
%    negdata5=make32(negdata5);
%    negdata5=double(negdata5(:,:,1));
%    negdata5=negdata5./max(max(negdata5));
%    d=log2(size(negdata5,1)); % 5 30 22 trial
%    [tree{1}, tree{2}] = calculateQuadtree(negdata5); % 5 30 22 trial
%    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
%end

% Set 7

%negativeimagefolder7 = 'Z:\Andre\2021 BETSE Sim Output\GJMosaic5050Autoscale3';
%listing = dir(negativeimagefolder7);
%len=length(listing);
%ind = [];
%for ii = 1:len
%    names=listing(ii).name;
%    if length(names)>=5 && all(names((end-2):end)=='png')
%        ind=[ind ii];
%    end
%end

%listing = listing(ind);
%len= length(listing);
%negimageset7 = zeros(1,len);
%for ii=1:len
%    names = listing(ii).name;
%    neg7filename = fullfile(negativeimagefolder7,names);
%    negdata7=imread(neg7filename);
%    negdata7=negdata7(200:800,100:700,:); %BETSE-specific filter
%    negdata7=imageTrim(negdata7,2);
%    negdata7=make32(negdata7);
%    negdata7=double(negdata7(:,:,1));
%    negdata7=negdata7./max(max(negdata7));
%    d=log2(size(negdata7,1)); % 5 30 22 trial
%    [tree{1}, tree{2}] = calculateQuadtree(negdata7); % 5 30 22 trial
%    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
%end