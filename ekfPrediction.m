function [x_prediction, P_pred] = ekfPrediction(x_estimation, p_init, delta, par,Q,vx,fyf,fyr)

dt = par.dt;
lcf = par.lcf;
P0 = p_init;
m = par.m;
lf = par.lf;
lr = par.lr;
iz = par.iz;

% Discretization
% Vehicle Dynamics Equations
dx = zeros(2,1);
dx(1) = (1/(m*vx) )* (fyf*cos(delta) + fyr) - x_estimation(2);
dx(2) = (lf/iz)*fyf*cos(delta) - (lr/iz)*fyr ;

% States Prediction
x_prediction = x_estimation + dt*dx;

% Jacobian Matrix
A = [1 -dt;
    0 1];

% Covariance prediction
P_pred = A * P0 * A' + Q;
end