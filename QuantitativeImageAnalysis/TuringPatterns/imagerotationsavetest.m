folderName = 'Z:\Andre\2021 BETSE Sim Output\Norm1';
saveImages = 1;

% G = imread('samp1.png');
% G = imrotate(G,90,'bilinear','crop');
% G = imageTrim(G,2);
% G = make32(G);
% G2 = double(G(:,:,1));

listing=dir(folderName);
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
% robustness = zeros(1,len);
for ii=1:len
    names=listing(ii).name;
    fileName=fullfile(folderName,names);
    data=imread(fileName);
    data=imrotate(data,90,'bilinear','crop');
    data=imageTrim(data,2);
    data=make32(data);
    %data=double(data(:,:,1));
    A = data;
    
    imageFolder = [folderName, '90rotate'];
    mkdir(imageFolder);


    im = zeros(32,32,3);
    %im(:,:,1) = A;
    % plot all:
    imwrite(A, [imageFolder, 'PATTERN ', num2str(ii), '.png'],'png');
end

% if(saveImages == 1)
    
%    imageFolder = [folderName, 'Images32_lilsetDre3'];
%    mkdir(imageFolder);


%    im = zeros(32,32,3);
    % plot all:
%    imwrite(data, [imageFolder, 'PATTERN', '.png'],'png');
%end
