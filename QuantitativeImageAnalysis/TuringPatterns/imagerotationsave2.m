saveimages = 1;
negativeimagefolder4 = 'Z:\Andre\2021 BETSE Sim Output\Norm1';
listing = dir(negativeimagefolder4);
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
negimageset4 = zeros(1,len);
for ii=1:len
    names = listing(ii).name;
    neg4filename = fullfile(negativeimagefolder4,names);
    negdata4=imread(neg4filename);
    negdata4 = imrotate(negdata4,90,'bilinear','crop');
    negdata4=imageTrim(negdata4,2);
    negdata4=make32(negdata4);
    negdata4=double(negdata4(:,:,1));
    negdata4=negdata4./max(max(negdata4));
    tree{1} = calculateQuadtree(negdata4);
    saveARFFTree(arffFile, tree, 1, labels, 'P', depth);
end

if(saveImages == 1)
    
    imageFolder = [folderName, 'Images32_lilsetDre3'];
    mkdir(imageFolder);


    im = zeros(patternSize, patternSize, 3);
    % plot all:
    im(:,:,1) = imread(neg4filename);
    imwrite(im, [imageFolder, 'PATTERN', '.png'],'png');

    for i=1:length(NPparameters)
        im(:,:,1) = ;
        imwrite(im, [imageFolder, 'NO_PATTERN ', num2str(i), '.png'],'png');
    end

end