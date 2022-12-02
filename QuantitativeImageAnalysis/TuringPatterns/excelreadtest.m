A = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A1:A66');

A2 = readmatrix('BETSENormAutoscale2vsinvitroall11_27.xlsx','Range','A307:A399');

% [h,p,ci,stats] = ttest2(A,A2)

[h,p] = ttest2(A,A2,'Vartype','unequal')

