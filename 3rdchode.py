import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import math

# Data for Youngs (lengths in nanometers)
d = 4200.0 #1 micrometer
a = 1400
lambred = 700 

deltasolved = 0
#I1 = 1 #Scale to Double Slit - 1 Curve
I5 = 1 #Scale to Single Slit - 2 Curve
I6 = 1

#Theta
theta = np.linspace(-np.pi/4.0, np.pi/4.0, 10000) #constant among three

#NSlit - Three peaks of IO Align 4, 16, 256
beta2 = (math.pi*(a)*np.sin(theta))/lambred
delta1 = (2.0*np.pi / lambred)*d*np.sin(theta)

bigI6 = I6*(np.cos(delta1/2.0))**2 #Double Slit


#bigI2 = I2*((np.sin(4*(delta2/2)))/np.sin(delta2/2))**2
#bigI3 = I3*((np.sin(16*(delta2/2)))/np.sin(delta2/2))**2
#bigI4 = I4*((np.sin(256.0*(delta2/2.0)))/np.sin(delta2/2.0))**2.0

bigI5 = I5*((np.sin(beta2)/beta2)**2)

bigI7 = bigI5 * bigI6


dovlamsintheta1 = (d / lambred)*np.sin(theta)

fig, ax = plt.subplots()
ax.plot(180/math.pi * (theta), bigI5, color = 'red', label = "Diffraction)")
ax.plot(180/math.pi * (theta), bigI6, color = 'blue', label = "Interference")
ax.plot(180/math.pi * (theta), bigI7, color = 'green', label = "Together")

#Resulting Intensity


plt.plot()
plt.legend(loc="upper left")
x_ticks = [-45, -30, -15, 0, 15, 30, 45]

plt.xticks(ticks=x_ticks)


ax.set(xlabel= "Theta (Degrees)", ylabel="Intensity (I)",
      title="Graph of Diffraction, Interference, and Together of Red Light")
ax.grid()

fig.savefig("youngs_ds.png")
plt.show()
