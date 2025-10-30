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
### Model of system:
$$
\dot{\beta} = \frac{fy_f*cos({\delta})-fy_r}{mV_x} - r
$$

$$
\dot{r} = \frac{l_ffy_f*cos({\delta})-l_r fy_r}{i_z V_x}
$$

### Measurement Model:
$$
\{a_y} = \frac{fy_f + fy_r}{m} + \{V_x r}
$$
$$
\dot{r} = \dot{r}
$$

Nonlinearity of the system could be caused of lateral forces model and considering non linear differential equation for the model.

for simplicuty, here the tire model is considered as linear model and just the model itself is considerd as nonlinear model.

##### Linear Tire Model: 
$$
\{fy_f} = \{c_f*{\alpha}_f }
$$
$$
\{fy_r} = \{c_r*{\alpha}_r }
$$
and 
$$
\{\alpha}_f = -{\delta} +{\beta}  - \frac{l_f* r}{V_x}
$$
$$
\{\alpha}_r = {\beta}- \frac{l_r* r}{V_x}
$$

for EKF, prediction step uses Forward Euler to descritze the model and then a jacobian matrix for predicting the covariance martrix.

### Mathematical Model:
$$
\dot{X} = \{f(x_1, x_2,.., \{\omega})}
$$
$$
\{y} = \{h(x_1, x_2, ..., \{\nu})}
$$
### Prediction Step:
$$
\{x^{-}_\{k+1}} = \{f(x_\{k}, \{\omega})}
$$
$$
\{P^{-}_\{k+1}} = \{A * P_\{k} * A^T + Q}
$$

A: Jacobian Matrix

#### Jacobian Matrix Calculation:
$$
\{A} = \begin{bmatrix}
  \frac{df_1}{dx_1} & \frac{df_1}{dx_2} & ... & \frac{df_1}{dx_n} \\
  \frac{df_2}{dx_1} & \frac{df_2}{dx_2} & ... & \frac{df_2}{dx_n} \\
  \{.} & \{.} & \{.} & \{.} \\
   \{.} & \{.} & \{.} & \{.} \\
    \{.} & \{.} & \{.} & \{.} \\
    \frac{df_n}{dx_1} & \frac{df_n}{dx_2} & ... & \frac{df_n}{dx_n}
\end{bmatrix}
$$

### Update Step:
$$
\{}
$$
