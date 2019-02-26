clear ; close all; clc

options = optimset('GradObj', 'on', 'MaxIter', '100');
initialTheta = zeros(2, 1);
% function minimization unconstrained 
% @costFunction means the pointer to the costFunction that we defined
[optTheta, functionVal, exitFlag] = fminunc(@costFunction, initialTheta, options)
