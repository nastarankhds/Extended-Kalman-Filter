function [x_estimate, P_estimate,C,k] = ekfUpdate(x_pred, P_pred,...
    y_measurement, R)


% two measurements: ay and yawrate

C = [0 0 ;0 1];

% Kalman gain
k = P_pred * C' * inv(C * P_pred * C' + R);

% Update state estimate
x_estimate = x_pred + k* (y_measurement' - C*x_pred);

% Update covariance estimate
P_estimate = (eye(size(P_pred)) - k * C) * P_pred;

end