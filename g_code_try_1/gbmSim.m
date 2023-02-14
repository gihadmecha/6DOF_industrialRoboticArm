function [m,mtrue,s,strue] = gbmSim(mu,sigma)
% Discrete approximation to geometric Brownian motion
%
% [m,mtrue,s,strue] = gbmSim(mu,sigma) computes the 
% simulated mean, true mean, simulated standard deviation, 
% and true standard deviation based on the parameters mu and sigma.
numReplicates = 1000; numSteps = 100;
y0 = 1;
t1 = 1;
dt = t1 / numSteps;
y1 = y0*prod(1 + mu*dt + sigma*sqrt(dt)*randn(numSteps,numReplicates));
m = mean(y1); s = std(y1);

% Theoretical values
mtrue = y0 * exp(mu*t1); strue = mtrue * sqrt(exp(sigma^2*t1) - 1);
end