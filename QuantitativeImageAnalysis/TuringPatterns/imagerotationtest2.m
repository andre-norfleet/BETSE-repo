labfolderName = 'Z:\Andre\2021 BETSE Sim Output\Norm24';
mkdir(folderName);
folderName = [folderName, 'Ex14BETSE'];
mkdir(folderName);


arffFile = [folderName, '148train_weka32today.arff']; % THE WEKA FILE
% arffFile = [folderName, 'test_weka32.arff']; % THE WEKA FILE
filename = 'Z:/Andre/2021 BETSE Output/Norm24/148train_weka32today.arff';

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
% tree{1} = tree{1}/tree{1}(1,1);

saveARFFTree(arffFile, tree, 0, labels, PatternTypes, depth);

%for i = 1:10
  %  tree{1} = calculateQuadtree(redimageset{i}); 
  %   tree{1} = tree{1}/tree{1}(1,1);
 %   saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
    %if(rem(i,500) == 0)
    %    i
%end

positiveimagefolder1 = 'Z:\Andre\2021 BETSE Sim Output\GJbetaGA';
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
    posdata1=imageTrim(posdata1,2);
    posdata1=make32(posdata1);
    posdata1=double(posdata1(:,:,1));
    posdata1=posdata1./max(max(posdata1));
    tree{1} = calculateQuadtree(posdata1);
    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
end

negativeimagefolder1 = 'Z:\Andre\2021 BETSE Sim Output\GJBlock501';
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
    negdata1=imageTrim(negdata1,2);
    negdata1=make32(negdata1);
    negdata1=double(negdata1(:,:,1));
    negdata1=negdata1./max(max(negdata1));
    tree{1} = calculateQuadtree(negdata1);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
end

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
    tree{1} = calculateQuadtree(negdata2);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
end

negativeimagefolder3 = 'Z:\Andre\2021 BETSE Sim Output\GJBlock751';
listing = dir(negativeimagefolder3);
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
negimageset3 = zeros(1,len);
for ii=1:len
    names = listing(ii).name;
    neg3filename = fullfile(negativeimagefolder3,names);
    negdata3=imread(neg3filename);
    negdata3=imageTrim(negdata3,2);
    negdata3=make32(negdata3);
    negdata3=double(negdata3(:,:,1));
    negdata3=negdata3./max(max(negdata3));
    tree{1} = calculateQuadtree(negdata3);
    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
end

%negativeimagefolder4 = 'Z:\Andre\2021 BETSE Sim Output\Norm1';
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
%    negdata4 = imrotate(negdata4,90,'bilinear','crop');
%    negdata4=imageTrim(negdata4,2);
%    negdata4=make32(negdata4);
%    negdata4=double(negdata4(:,:,1));
%    negdata4=negdata4./max(max(negdata4));
%    tree{1} = calculateQuadtree(negdata4);
%    saveARFFTree(arffFile, tree, 1, labels, 'NP', depth);
%end
