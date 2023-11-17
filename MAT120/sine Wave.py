# sine wave: 5sin(120πt)
# Ques 2 solved using matplotlib and numpy. 

import numpy as np
import matplotlib.pyplot as plt

T = 1/60  # Period
t = np.linspace(0, T, 1000) 

A = 5  # Amplitude
f = 60  # Frequency
sine_wave = A * np.sin(2 * np.pi * f * t)

# Plot the sine wave
plt.figure(figsize=(8, 4))
plt.plot(t, sine_wave)
plt.title("Sine Wave: 5sin(120πt)")
plt.xlabel("Time (s)")
plt.ylabel("Amplitude")
plt.grid(True)
plt.show()
