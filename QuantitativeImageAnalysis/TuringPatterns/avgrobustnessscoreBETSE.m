
imageFolder = 'Z:\Andre\avgeScore2';
load('BETSENormAutoscale2formulamatfile.mat', 'ans');
formula = ans;
color = 1;
outputFile = 'Z:\Andre\avgeScore2\209thtestoutput';
outputFile3 = 'Z:\Andre\avgeScore2\209Bthtestoutput.xlsx'

listing=dir(imageFolder); %lists folder contents
len=length(listing);
ind=[];
for ii=1:len
    names=listing(ii).name;
    if length(names)>=5 && all(names((end-2):end)=='png')
        ind=[ind ii];
    end
end

lemon = 33;

robustness = zeros(1,20,3);
for i=1:20
    for j=1:3
        image= ['Z:\Andre\avgeScore2\sim_',num2str(i),'_',num2str(j),'\fig_final_vmem_2D_2.png'];
        imagelist = image;
        data = imread(image);
        data=data(200:800,100:700,:);
        data=imageTrim(data,2);
        data=make32(data);
        data=double(data(:,:,color));
        data=data./max(max(data));
        d=log2(size(data,1));
        [quadtree{1}, quadtree{2}]=calculateQuadtree(data);
        robustness(1,i,j) = modelCheckPattern(formula, quadtree, 'P ');
        simmean(1,i) = mean(robustness(1,i,1:3));
    end
end

[B,I] = sort(simmean);
orderedscores = B.';
orderedsimindex = I.';
writematrix('Scores', outputFile3, 'Sheet',1,'Range','A1');
writematrix('indices', outputFile3, 'Sheet',1,'Range','B1');
writematrix(orderedscores, outputFile3, 'Sheet',1,'Range','A2:A21');
writematrix(orderedsimindex, outputFile3, 'Sheet',1,'Range','B2:B21');
