import numpy as np
import matplotlib.pyplot as plt

# Set the range of phase differences to consider
delta_range = np.linspace(-3*np.pi, 3*np.pi, 100000)

# Set the intensity of each individual source
I_0 = 1

# Calculate the intensity for N=4 sources
N = 4
intensity_4 = 16 * (np.sin(N*delta_range/2) / (np.sin(delta_range/2) + 1e-9))**2

# Calculate the intensity for N=16 sources
N = 16
intensity_16 = I_0 * (np.sin(N*delta_range/2) / (np.sin(delta_range/2) + 1e-9))**2

# Calculate the intensity for N=256 sources
N = 256
intensity_256 = 0.00385 * (np.sin(N*delta_range/2) / (np.sin(delta_range/2) + 1e-9))**2

# Set up the plot
plt.plot(delta_range, intensity_4, color='red', label='N=4')
plt.plot(delta_range, intensity_16, color='blue', label='N=16')
plt.plot(delta_range, intensity_256, color='black', label='N=256')
plt.xlabel('Phase Difference (radians)')
plt.ylabel('Intensity')
plt.title('N-Slit Interference')
plt.legend()

# Show the plot
plt.show()
