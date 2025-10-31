clc, clear all

% Extended kalman Filter

% siganl and Parameters
Parameters;

% Measurement [ay; yawarate]
y_measurement = [ay  yawrate];

% adding noise to measurements:
noise_variance_ay = 0.0003;
noise_variance_yawrate = 0.00003;

noise_measurement_ay = wgn(length(y_measurement), 1, noise_variance_ay, 'linear');
noise_measurement_yawrate = wgn(length(y_measurement), 1, noise_variance_yawrate, 'linear');
noise_measurement_ay = noise_measurement_ay - mean(noise_measurement_ay);                     % unbiased Estimation
noise_measurement_yawrate = noise_measurement_yawrate - mean(noise_measurement_yawrate);      % noise mean value is zero
noise_measurement =[noise_measurement_ay noise_measurement_yawrate];
y_measurement = y_measurement + noise_measurement;

% Visualization of the noisy measurement
figure
subplot 211
plot(Time,y_measurement(:,1),'b','linewidth',1),hold on
plot(Time,ay,'-r','linewidth',0.5)
grid minor
title 'Acceleration'
legend 'Noisy signal' 'no noise'
subplot 212
plot(Time,y_measurement(:,2),'b','linewidth',0.5),hold on
plot(Time,yawrate,'-r','linewidth',1)
grid minor
title 'Yaw Rate'
legend 'Noisy signal' 'no noise'

% initial state Estimation, based on noisy measurement of carmaker [Betha ;phidot]
x_init = [beta(1) yawrate(1)]';

% intial Covariance : shows Uncertainty of Estimation of initial states
p_init =diag([0.001 0.001]);

% Covariance of Noise Q, Covariance of Measurement R
% you can start by a random valued for covariance, then tune it.
[R,Q] = covQR(signal,noise_measurement);
%%

% matrix to store data
x_estimation = zeros(2,N+1);
x_estimation(:,1) = x_init;
vertical_forces = zeros(N,2);
lateral_load = zeros(N,2);
alpha = zeros (N,2);
% _cm(i)

for i=1:N

    [fzf,fzr] = vertical_load(par,ay(i),ax(i));
    vertical_forces(i, :) = [fzf fzr];
    % for lateral forces , you can use a linear tire force as mentioned in README file.
    [fyf,fyr,alpha_f,alpha_r] = lateral_forces(x_init,par,delta(i),fzf,fzr,vx(i));


    lateral_load(i,:) = [fyf fyr];
    alpha(i,:) = [alpha_f alpha_r];


    % Prediction step
    [x_pred, P_pred] = ekfPrediction(x_init, p_init, delta(i), par,Q,vx(i),fyf,fyr);
    x_prediction(:,i) = x_pred;

    %  Update step
    [x_estimate, P_estimate, C,k] = ekfUpdate(x_pred, P_pred,(y_measurement(i,:)), R);

    x_estimation(:,i+1) = x_estimate;

    % Update initial states estimation for next iteration
    x_init = x_estimate;
    p_init = P_estimate;
end

%%
PlotResult;

