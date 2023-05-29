import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


# Define the system of ODEs
def system(t, variables, sigma, r, beta):
  x, y, z = variables
  dx = sigma * (y - x)
  dy = x * (r - z) - y
  dz = x * y - beta * z
  return [dx, dy, dz]


# Runge-Kutta method
def runge_kutta(system, t_range, variables0, args):
  t_values = np.linspace(t_range[0], t_range[1], num=10000)
  h = t_values[1] - t_values[0]
  variables = np.zeros((len(t_values), len(variables0)))
  variables[0] = variables0

  for i in range(1, len(t_values)):
    k1 = system(t_values[i - 1], variables[i - 1], *args)
    k2 = system(t_values[i - 1] + 0.5 * h,
                variables[i - 1] + 0.5 * h * np.array(k1), *args)
    k3 = system(t_values[i - 1] + 0.5 * h,
                variables[i - 1] + 0.5 * h * np.array(k2), *args)
    k4 = system(t_values[i - 1] + h, variables[i - 1] + h * np.array(k3),
                *args)
    variables[i] = variables[i - 1] + (h / 6) * (
      np.array(k1) + 2 * np.array(k2) + 2 * np.array(k3) + np.array(k4))

  return t_values, variables


# Parameters
sigma = 10
r = 28
beta = 8 / 3

# Initial conditions
x0, y0, z0 = 0, 1, 20
variables0 = [x0, y0, z0]

# Time range
t_range = [0, 40]

# Solve using Runge-Kutta method
t_values_rk, variables_rk = runge_kutta(system, t_range, variables0,
                                        (sigma, r, beta))

# Solve using solve_ivp
sol = solve_ivp(lambda t, variables: system(t, variables, sigma, r, beta),
                t_range,
                
                variables0,
                method='RK45')

# Plotting
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.plot(variables_rk[:, 0],
        variables_rk[:, 1],
        variables_rk[:, 2],
        label='Runge-Kutta')
ax.plot(sol.y[0], sol.y[1], sol.y[2], label='solve_ivp')

ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

ax.legend()

plt.show()
