%[~,~,dat]=xlsread('cellmetricExpt_Expandedcellsincolony.csv');
%dat=[dat(2:end,21) dat(2:end,22)]; % 19-S & 18-R
M = readmatrix('cellmetricExpt_Expandedcellsincolony.csv','Range','U2:V106');

x = M(:,1);
y = M(:,2);

scatter(x,y,'filled','k')
%set(gca, 'Color', 'white')
saveas(gcf,'CellLocationtest4','svg')
