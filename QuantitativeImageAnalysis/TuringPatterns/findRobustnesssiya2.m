%Computes TSSL robustness score for all images in a folder
%imageFolder: name of folder containing the images (string)
%wekaFile: name of file containing WEKA rules (string)
%color: the color channel that is used to build quadtrees; color=1 for red,
%color=2 for green, color =3 for blue
%outputFile: output file name in which robustness scores for all images are
%stored (string)
%makePlot: either true or false. if true, plots the robustness scores
%robustness: a vector containing all the robustness scores
%m: the maximum robustness value

function [robustness, m]=findRobustness(imageFolder,formula,color,outputFile, makePlot)

imageFolder = 'Z:\Andre\2021 BETSE Sim Output\RandomsampPerm2';
load('BETSENormAutoscale2formulamatfile.mat', 'ans');
formula = ans;
color = 1;
outputFile = 'Z:\Andre\Code\TuringPatterns\167Dthtestoutput';
outputFile2 = 'Z:\Andre\Code\TuringPatterns\167Dthtestoutput33.xlsx';
%folderName = [folderName, 'Ex14BETSE'];
%mkdir(folderName);
makePlot = true;

if ~isa(imageFolder, 'char')
    error('imageFolder must be a string')
elseif ~ismember(color, [1,2,3])
    error('color must be 1 or 2 or 3')
elseif ~isa(makePlot, 'logical')
    error('makePlot must be logical true or false')
end
fclose all;
if isa(outputFile, 'char')
    fid=fopen(outputFile,'w');
end

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
        fprintf(fid,names); %trial
        fprintf(fid,': '); %trial
        fprintf(fid,num2str(robustness(1,ii)));
        fprintf(fid,'\n');
    end
    if isa(outputFile2, 'char') %trial2
        %names=[listing(ii).name];
        %name3=zeros(1,ii);
        %nameall=[];
        %namegg = 
        
        %% Siya's Edits
         for x = 1:length(listing)
             nameall = [];
             nameall = [nameall {listing(x).name}];
             adam22 = robustness;
             %for y = 1:length(robustness)
                 %adam22 = [adam22 {robustness(y)}]
                 %adam22 = transpose(adam22)
                 %cA = [adam22 transpose(nameall)]
                 %writecell(cA, nameofexcelfile)
             end
         end
       
       
        
        
        %These are the column A values 
%         adam22 = robustness.';
%         writematrix(adam22, outputFile2,'Sheet',1,'Range','A1:A10'); %trial2
%         writematrix(nim, outputFile2,'Sheet',1,'Range','B1:B10');
%         
        
    end
end
m=max(robustness,[],2);
if isa(outputFile, 'char')
    fprintf(fid, 'The maximum robustness is ');
    fprintf(fid, num2str(m));
    fprintf(fid, '\n');
    fclose(fid);
end
if makePlot==true
    clf();
    %plot(robustness);
    %figure;
    addpath('Z:\Andre\Code\TuringPatterns\lib');
    plot(robustness);
%% plot now
    opt.XLabel = 'Image number (i)'; % xlabel
    opt.YLabel = 'Robustness Score'; %ylabel
    opt.Colors = [0, 0 0];
    %opt.XLim = [0, 40]; % set x axis limit
    %opt.YLim = [-11, 11]; % set y axis limit
% Save? comment the following line if you do not want to save
    opt.FileName = 'plotAxisLimit.jpg'; 
% create the plot
    setPlotProp(opt);
    saveas(1,'Scores.png');
end