% GENERATING DATA SETS FROM THE SIMPLE TURING SYSTEM:
% 
close all;

% turing pattern dataset

folderName = 'Z:\Andre\2021 BETSE Sim Output\Norm79';
mkdir(folderName);
folderName = [folderName, 'Ex69BETSE'];
mkdir(folderName);


arffFile = [folderName, '698train_weka32today.arff']; % THE WEKA FILE
% arffFile = [folderName, 'test_weka32.arff']; % THE WEKA FILE
filename = 'Z:/Andre/2021 BETSE Output/Norm79/698train_weka32today.arff';

PatternTypes = {'P', 'NP'}; % For the weka you can use any number of pattern types, we use 2. Initialize the pattern names here.
% P : pattern, NP: nopattern


% patternSize
patternSize = 32; % A 32x32 grid will be used.  
labels = {'RED'}; % Rm : stands for Red mean, 
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

imageFolder1 = 'Z:\Andre\2021 in vitro outcomes\bGA60all_1';
listing=dir(imageFolder1);
len=length(listing);
ind=[];
for ii=1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end

listing=listing(ind);
len=length(listing);
%robustness = zeros(1,len);
posimageset1 = zeros(1,len);
for ii=1:len
    names=listing(ii).name;
    fileName=fullfile(imageFolder1,names);
    data=imread(fileName);
    data = min(data, [], 3); %new
    data= data < 200; %new
    data=bwareafilt(data, 1); %new
    [rows, columns] = find(data); %new
    row1 = min(rows); %new
    row2 = max(rows); %new
    col1 = min(columns); %new
    col2 = max(columns); %new
    data=data(row1:row2, col1:col2, :); %new
    data=imageTrim(data,2);
    data=make32(data);
    data=double(data(:,:,1));
    data=data./max(max(data));
    d=log2(size(data,1));
    tree{1} = calculateQuadtree(data);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    %robustness(1,ii) = modelCheckPattern(formula, quadtree, 'P ');
end


imageFolder2 = 'Z:\Andre\2021 in vitro outcomes\Ctrlall_3';

listing=dir(imageFolder2);
len=length(listing);
ind=[];
for ii=1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end
listing=listing(ind);
len=length(listing);
%robustness = zeros(1,len);
negimageset2 = zeros(1,len);
for ii=1:len
    names=listing(ii).name;
    fileName=fullfile(imageFolder2,names);
    data=imread(fileName);
    data = min(data, [], 3); %new
    data= data < 200; %new
    data=bwareafilt(data, 1); %new
    [rows, columns] = find(data); %new
    row1 = min(rows); %new
    row2 = max(rows); %new
    col1 = min(columns); %new
    col2 = max(columns); %new
    data=data(row1:row2, col1:col2, :); %new
    data=imageTrim(data,2);
    data=make32(data);
    data=double(data(:,:,1));
    data=data./max(max(data));
    d=log2(size(data,1));
    tree{1} = calculateQuadtree(data);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    %robustness(1,ii) = modelCheckPattern(formula, quadtree, 'P ');
end

imageFolder3 = 'Z:\Andre\2021 in vitro outcomes\bGA10all_1';

listing=dir(imageFolder3);
len=length(listing);
ind=[];
for ii=1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end
listing=listing(ind);
len=length(listing);
%robustness = zeros(1,len);
negimageset3 = zeros(1,len);
for ii=1:len
    names=listing(ii).name;
    fileName=fullfile(imageFolder3,names);
    data=imread(fileName);
    data = min(data, [], 3); %new
    data= data < 200; %new
    data=bwareafilt(data, 1); %new
    [rows, columns] = find(data); %new
    row1 = min(rows); %new
    row2 = max(rows); %new
    col1 = min(columns); %new
    col2 = max(columns); %new
    data=data(row1:row2, col1:col2, :); %new
    data=imageTrim(data,2);
    data=make32(data);
    data=double(data(:,:,1));
    data=data./max(max(data));
    d=log2(size(data,1));
    tree{1} = calculateQuadtree(data);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    %robustness(1,ii) = modelCheckPattern(formula, quadtree, 'P ');
end

imageFolder4 = 'Z:\Andre\2021 in vitro outcomes\K10all_1';

listing=dir(imageFolder4);
len=length(listing);
ind=[];
for ii=1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end
listing=listing(ind);
len=length(listing);
%robustness = zeros(1,len);
negimageset4 = zeros(1,len);
for ii=1:len
    names=listing(ii).name;
    fileName=fullfile(imageFolder4,names);
    data=imread(fileName);
    data = min(data, [], 3); %new
    data= data < 200; %new
    data=bwareafilt(data, 1); %new
    [rows, columns] = find(data); %new
    row1 = min(rows); %new
    row2 = max(rows); %new
    col1 = min(columns); %new
    col2 = max(columns); %new
    data=data(row1:row2, col1:col2, :); %new
    data=imageTrim(data,2);
    data=make32(data);
    data=double(data(:,:,1));
    data=data./max(max(data));
    d=log2(size(data,1));
    tree{1} = calculateQuadtree(data);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    %robustness(1,ii) = modelCheckPattern(formula, quadtree, 'P ');
end

imageFolder5 = 'Z:\Andre\2021 in vitro outcomes\K20all_1';

listing=dir(imageFolder5);
len=length(listing);
ind=[];
for ii=1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end
listing=listing(ind);
len=length(listing);
%robustness = zeros(1,len);
negimageset5 = zeros(1,len);
for ii=1:len
    names=listing(ii).name;
    fileName=fullfile(imageFolder5,names);
    data=imread(fileName);
    data = min(data, [], 3); %new
    data= data < 200; %new
    data=bwareafilt(data, 1); %new
    [rows, columns] = find(data); %new
    row1 = min(rows); %new
    row2 = max(rows); %new
    col1 = min(columns); %new
    col2 = max(columns); %new
    data=data(row1:row2, col1:col2, :); %new
    data=imageTrim(data,2);
    data=make32(data);
    data=double(data(:,:,1));
    data=data./max(max(data));
    d=log2(size(data,1));
    tree{1} = calculateQuadtree(data);
    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
    %robustness(1,ii) = modelCheckPattern(formula, quadtree, 'P ');
end
