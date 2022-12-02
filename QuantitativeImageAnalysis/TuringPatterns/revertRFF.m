

filename = '/Z:/Andre/Code/EXAMPLES3/Ex3train_weka32today';

outputFile = [ filename, 'revert.arff' ] ;





in = fopen([ filename, '.arff'], 'r');
out = fopen(outputFile, 'w');

tline = fgetl(in);

while ischar(tline)
    
    if (~isempty(tline))
        if(tline(1) == '@')
            fprintf(out, '%s\n', tline);
        else
           % parse normalize:
           v = find(tline == ',');
           E = [v - 1];
           S = [1, v(1:end-1) + 1];
           T = zeros(length(v),1);
           for i=1:length(T)
               T(i) = str2double(tline(S(i):E(i)));
           end
           T = T/max(T);

           for i=1:length(T)
               fprintf(out, '%f, ', T(i));
           end
           fprintf(out, '%s\n', tline(v(end)+1:end));

        end 
    end
    
    tline = fgetl(in);
end

fclose(in);
fclose(out);



