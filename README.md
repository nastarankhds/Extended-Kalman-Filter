# Extended-Kalman-Filter
MATLAB code, EKF, CarMaker Maneuvre
here you can find the extended kalamn filter process. it is used for systems where the system differential equations are not linear.
the extended kalman filter is explain by an example for sideslip angle and yaw rate estimation in a maneuvre.

## what does this code do
it estimates the states such as sideslip angle and yaw rate from noisy measured signals using a nonlinear system model and its jacobians.

for EKF, prediction step uses Forward Euler to descritze the model and then a jacobian matrix for predicting the covariance martrix.

### Mathematical Model:
$$
\dot{X} = \{f(x_1, x_2,.., \{\omega})}
$$
which could be written: 
$$ \dot{f_1} =  \{f(x_1, x_2,.., \{\omega}_1)} $$
$$ \dot{f_1} =  \{f(x_1, x_2,.., \{\omega}_2)} $$
$$ \{.} $$
$$ \{.} $$
$$ \{.} $$
$$ \dot{f_n} =  \{f(x_1, x_2,.., \{\omega}_n)} $$

and for the measurement:

$$
\{y} = \{h(x_1, x_2, ..., \{\nu})}
$$
### Prediction Step:
$$
\{\hat{x}^{-}_\{k+1}} = \{f(x_\{k}, \{\omega})}
$$
$$
\{P^{-}_\{k+1}} = \{A * P_\{k} * A^T + Q}
$$

A: Jacobian Matrix

note: 

$$ \{f(x_\{k}, \{\omega})} = \{\{x_\{k-1}} + \{dt} * \dot{X_\{k-1}} } $$

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
kalman gain:

$$ \{K_{k}} = \{P^{-}_\{k}}\{\{\hat{H}_k}}^\{T}{(\hat{H}_{k} \{P}^{-}_{k} \{\hat{H}_k}^\{T} + \{R})}^{-1} $$

$$ \{\hat{x}_\{k+1}} = \{\hat{x}^{-}_\{k}} + \{K_\{k} (y - \{h(\{\hat{x}^{-}_\{k}})})} $$

$$ \{P_{k}} = \{(\{I} - \{K_\{k}} \{\hat{H}_{k}}) \{P^{-}_\{k}}}  $$


### Signals and parameters
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


in this system, the model is considered as nonlinear system and measurement as linear system.

based on this this prediction step would be:

$$ \{\hat{\beta}^{-}_\{k+1}} = \{\hat{\beta}_\{k}} + \{dt}  * (\frac{\{fy_f}_\{k+1}*cos({\delta_\{k+1}})-\{fy_r}_\{k+1}}{m\{V_x}_\{k+1}} - r_\{k+1}) $$

$$ \{\hat{r}^{-}_\{k+1}} = \{\hat{r}_\{k}} + \{dt}  * (\frac{l_f \{fy_f}_\{k+1}*cos({\delta_\{k+1}})-l_r \{fy_r}_{k+1}}{i_z \{V_x}_\{k+1}}) $$

$$ \{A} =  \begin{bmatrix}
\{1} & \{-dt} \\
0 & 1
\end{bmatrix} $$
