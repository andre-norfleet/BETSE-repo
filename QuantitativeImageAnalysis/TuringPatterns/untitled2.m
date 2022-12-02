
close all;


% script for snapshots: 
PatternParameters.CA = 1.44;
PatternParameters.CB = 5.27;
PatternParameters.dt = 0.01;
PatternParameters.T = 60;



folderName = [ '/Users/ebru/Desktop/TuringDataSet/Snapshots/'];
mkdir(folderName);

testNum = 1;
folderName = [ folderName , num2str(testNum), '__' , num2str(PatternParameters.CA), '__', num2str(PatternParameters.CB), '/' ];
mkdir(folderName);


fileNameBase = [folderName , 'snapshotP5_3_'];

TuringSimulationSnapShot(32, PatternParameters, fileNameBase);


