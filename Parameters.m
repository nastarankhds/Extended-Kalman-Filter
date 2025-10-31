% Parameters
par.m   = 1574;                  % kg
par.iz  = 2243.043;              % kg/m2 
par.lf  = 1.024;                 % m
par.lr  = 1.602;                 % m
par.meu = 0.9;
par.g   = 9.81;                  %m/s2
par.cf  =  -1.8897e+05;
par.cr  = -1.4990e+05;

par.track_f = 1.55;             % m
par.track_r = 1.521;            % m
par.lcf = 1.888 + 0.2 ;                % m 1.935
par.l = par.lf + par.lr;        % m
par.hg = 0.561;                 % m
% % Center of Gravity : 2.365	0.000	0.563 ;


% Reading the Signal
% signal = readmatrix('LC_Turning.xlsx');
signal = readmatrix('LC_Turning_higher.xlsx');

fyf_cm = signal(:,5) +signal(:,6);
fyr_cm = signal(:,7) +signal(:,8);
fzf_cm = signal(:,9) + signal(:,10);
fzr_cm = signal(:,11) +signal(:,12);
alpha_f_cm = (signal(:,14)+signal(:,15))/2;
alpha_r_cm = (signal(:,16)+signal(:,17))/2;
delta = (signal(:,18) + signal(:,19))/2;                         % steering angle
yawrate = signal(:,23); 
ax = signal(:,24);                                             % car.ax
ay = signal(:,25);                                             % car.ay     
vx = signal(:,26);                                             % car.vx
beta = signal(:,13);                                             % Car.SideSlipAngle


Time = signal(:,29);
T = Time(end);                            % simulation time (s)
dt =  Time(10)-Time(9);                   % sampling rate
par.dt = dt;
N =  length(Time);                    % number of time steps




