mu = [-.5; -.25; 0; .25; .5];
sigma = [.1; .2; .3; .2; .1];

params = table(mu,sigma)

stats = rowfun(@gbmSim,params,...
    'OutputVariableNames',...
    {'simulatedMean' 'trueMean' 'simulatedStd' 'trueStd'})