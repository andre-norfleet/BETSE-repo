imageFolder = 'Z:\Andre\2021 in vitro outcomes\bGA60all_1samp';

listing=dir(imageFolder);
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
robustness = zeros(1,len);
for ii=1:len
    names=listing(ii).name;
    fileName=fullfile(imageFolder,names);
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
    data=double(data(:,:,color));
    data=data./max(max(data));
    d=log2(size(data,1));
    [quadtree{1}, quadtree{2}]=calculateQuadtree(data);
    robustness(1,ii) = modelCheckPattern(formula, quadtree, 'P ');
    if isa(outputFile, 'char')
        %fprintf(fid,names);
        %fprintf(fid,': ');
        fprintf(fid,num2str(robustness(1,ii)));
        fprintf(fid,'\n');
    end
end

grayImage = min(rgbImage, [], 3); % extracts min value for 3rd array of rgbimage
binaryImage = grayImage < 200;
binaryImage = bwareafilt(binaryImage, 1); % extracts all connected components
[rows, columns] = find(binaryImage);
row1 = min(rows);
row2 = max(rows);
col1 = min(columns);
col2 = max(columns);
% Crop
croppedImage = rgbImage(row1:row2, col1:col2, :);