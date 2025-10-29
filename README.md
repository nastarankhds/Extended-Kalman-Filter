# Extended-Kalman-Filter
MATLAB code, EKF, CarMaker Maneuvre
here you can find the extended kalamn filter process. it is used for systems where the system differential equations are not linear.
the extended kalman filter is explain by an example for sideslip angle and yaw rate estimation in a maneuvre.

## what does this code do
it estimates the states such as sideslip angle amnd yaw rate from noisy measured signals using a nonlinear system model and its jacobians.

## Signals and parameters
- **States:** $x = [\beta,\ r]^\top$
- **Input:** $u = \delta$
- **Measurements:** $y = [a_y,\ r]^\top$
- **Params:** $m, I_z, a, b, C_f, C_r, V_x$  
Units: radians, m/s, N, kg, m, kg·m².

The system's model is derived based on bicycle model.
### System's Model
$$
\dot{\beta} = \frac{fy_f*cos({\delta})-fy_r}{mV_x} - r
$$

$$
\dot{r} = \frac{}
