% e_estimate_betha =abs(aa(3:1773,13) - x_estimation(1,:)');
time = 0:dt:T;

figure
subplot 211
plot(Time,x_estimation(1,1:end-1),'r-', 'LineWidth', 1.5);hold on
plot(Time,beta,'b', 'LineWidth', 1.5);
legend ('ß Estimation','Measured by IPG')
grid on
% ylim([-0.1 0.1])
subplot 212
plot(Time,x_estimation(2,1:end-1),'r-', 'LineWidth', 1.5);hold on
plot(Time,yawrate,'b', 'LineWidth', 1.5);
legend ('yaw Rate Estimation','Measured by IPG')
grid on

% Comparing
figure
subplot 211
plot(lateral_load(1:end-1,1),'LineWidth', 1.5);
hold on
plot (fyf_cm(1:end-1),'LineWidth', 1.5)
legend ('fyf based on calculation','fyf IPG')
title(' Comapring lateral Forces')
grid minor
subplot 212
plot(lateral_load(1:end-1,2),'LineWidth', 1.5);
hold on
plot (fyr_cm(1:end-1),'LineWidth', 1.5)
legend ('fyr based on calculation','fyr IPG')
grid minor
% 
figure
subplot 211
plot(vertical_forces(:,1),'LineWidth', 1.5);
hold on
plot (fzf_cm(1:end-1),'LineWidth', 1.5)
legend ('fzf based on calculation','fzf IPG')
title(' Comapring Vertical Forces')
grid minor
subplot 212
plot(vertical_forces(:,2),'LineWidth', 1.5);
hold on
plot (fzr_cm(1:end-1),'LineWidth', 1.5)
legend ('fzr based on calculation','fzr IPG')
grid minor
% 
figure
subplot 211
plot(alpha(:,1),'LineWidth', 1.5);
hold on
plot(alpha_f_cm,'LineWidth', 1.5);
legend ('alpha_f based on calculation','alpha_f IPG')
grid on

subplot 212
plot(alpha(:,2),'LineWidth', 1.5);
hold on
plot(alpha_r_cm,'LineWidth', 1.5);
legend ('alpha_r based on calculation','alpha_r IPG')
grid on

figure
subplot 211
plot(alpha(:,1),lateral_load(:,1),'diamond','color','b'),hold on
plot(alpha_f_cm,fyf_cm,'r.')
legend 'Calculated' 'Car Maker'
xlabel '\alpha_r'
ylabel 'fy_f'
grid minor
subplot 212
plot(alpha(:,2),lateral_load(:,2),'diamond','color','b'),hold on
plot(alpha_r_cm,fyr_cm,'r.')
legend 'Calculated' 'Car Maker'
xlabel '\alpha_r'
ylabel 'fy_r'
grid minor
