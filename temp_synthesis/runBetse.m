function folderName = runBetse(parameters, tries)

[STATUS, MSG, MSGID] = copyfile ('../model/*',pwd);
folderName = cell(tries);
type1 = 'Dm_K';
type2 = 'Dm_Na';
type3 = 'Dm_Cl';
type4 = 'gj_sa'; %****try


%for ii = 1:tries
%    cmd{ii} = strcat('python BetseSetup2.py "', ...
%    type1,'" "', num2str(parameters(1)),'" "', ...
%    type2,'" "', num2str(parameters(2)),'" "', ...
%    type3,'" "', num2str(parameters(3)),'" "', ...
%    type4,'" "', num2str(parameters(4)),'" "',num2str(ii),'"');

% Call python script that sets up and/or modify BETSE config file
%One Parameter
%for ii = 1:tries
%    cmd{ii} = strcat('python BetseSetup2.py "', ...
%    type1,'" "', num2str(parameters(1)),'" "',num2str(ii),'"');


%Two Parameters 
for ii = 1:tries
    cmd{ii} = strcat('python BetseSetup2.py "', ...
    type1,'" "', num2str(parameters(1)),'" "', ...
    type2,'" "', num2str(parameters(2)),'" "',num2str(ii),'"');

system(cmd{ii});

%folderName{ii} = fullfile('/storage/scratch1/5/dnorfleet7/my_simdre2/Multicellular-Pattern-Synthesis/temp_synthesis/simulations',sprintf('%s_%s_%s_%s_%s_%s_%s_%s_%d', ...
%   type1,num2str(parameters(1)),type2,num2str(parameters(2)),type3,num2str(parameters(3)),type4,num2str(parameters(4)),ii),'/RESULTS/sim_2620');

% This section selects the sim parameter-specific output folders for similarity analysis 

%One Parameter
%folderName{ii} = fullfile('/storage/scratch1/5/dnorfleet7/my_simdre2/Multicellular-Pattern-Synthesis/temp_synthesis/simulations',sprintf('%s_%s_%d', ...
%   type1,num2str(parameters(1)),ii),'/RESULTS/sim_2620');

%Two Parameter
folderName{ii} = fullfile('/storage/scratch1/5/dnorfleet7/my_simdre2/Multicellular-Pattern-Synthesis/temp_synthesis/simulations',sprintf('%s_%s_%s_%s_%d', ...
   type1,num2str(parameters(1)),type2,num2str(parameters(2)),ii),'/RESULTS/sim_2620');


%disp(folderName{ii})

end

