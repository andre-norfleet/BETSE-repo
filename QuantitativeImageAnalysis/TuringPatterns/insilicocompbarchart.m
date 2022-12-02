%x = 1:5;
x = categorical({'Normal','GJ Block 75%','GJ Beta GA','K10supp',});
x = reordercats(x,{'Normal','GJ Block 75%','GJ Beta GA','K10supp'});
data = [0.060765514497713 -0.0127978956521739 0.047393815 -0.002907178]';
errhigh = [0.003402212 0.001029667 0.003419175 0.001165997];
errlow  = [0.003402212 0.001029667 0.003419175 0.001165997];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off