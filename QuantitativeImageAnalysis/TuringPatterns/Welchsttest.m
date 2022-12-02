A = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A1:A66');

K20 = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A307:A399');
bGA10uM = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A68:A132');
bGA60uM = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A134:A218');
K10 = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A220:A305');
Ctrl = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A401:A491');

%[h,p] = ttest2(Ctrl,K10,'Vartype','unequal','Alpha',0.05)
[h,p] = ranksum(K10,bGA60uM)