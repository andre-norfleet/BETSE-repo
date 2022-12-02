%x = 1:5;
x = categorical({'Normal','GJ Block 75%','GJ Beta GA','K10supp','Normal + 90','Normal + 90 + 180','90 solo','180 solo','270 solo'});
x = reordercats(x,{'Normal','GJ Block 75%','GJ Beta GA','K10supp','Normal + 90','Normal + 90 + 180','90 solo','180 solo','270 solo'});
data = [0.060765514497713 -0.0127978956521739 0.047393815 -0.002907178 0.066095274 0.067869684 0.071425033 0.071418504 0.071240431]';
errhigh = [0.003402212 0.001029667 0.003419175 0.001165997 0.002430482 0.001981485 0.003405789 0.003411066 0.003451915];
errlow  = [0.003402212 0.001029667 0.003419175 0.001165997 0.002430482 0.001981485 0.003405789 0.003411066 0.003451915];

bar(x,data)                

hold on

er = errorbar(x,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off