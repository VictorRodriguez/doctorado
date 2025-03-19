import numpy as np
import matplotlib.pyplot as plt
from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import RBF, ConstantKernel as C, WhiteKernel

# Load data
data = np.array([
    [2.36003331, 0.610676113, 1.439549135],  # [Observed Gain, Vectorization %, Expected Gain]
    [2.22536593, 0.652471444, 1.484198603],
    [1.9376159, 0.66770471, 1.501168709],
    [2.03813371, 0.675591317, 1.510107888],
    [1.99464823, 0.680413373, 1.515626151],
    [2.07676138, 0.683666515, 1.519371817],
    [2.06511035, 0.686009301, 1.522080789],
    [1.94811815, 0.687776959, 1.524131141],
    [2.00349527, 0.689158117, 1.525737029],
    [2.02750365, 0.690267045, 1.527028843],
    [2.02873674, 0.691177008, 1.528090515],
    [2.05364935, 0.691937146, 1.528978515],
    [2.01828171, 0.692581647, 1.529732236],
    [2.00554486, 0.693135033, 1.530379994],
    [1.99512277, 0.693615351, 1.530942668],
    [2.08855719, 0.694036175, 1.531435987],
    [2.03344117, 0.694407915, 1.531872032],
    [2.06121598, 0.694738684, 1.532260227],
    [2.00666367, 0.695034904, 1.532608042],
    [2.02479464, 0.695301714, 1.532921458],
    [1.92380428, 0.695543293, 1.533205349],
    [2.03869352, 0.695763057, 1.533463694],
    [2.01751635, 0.695963832, 1.533699792],
    [2.04677621, 0.696147978, 1.5339164],
    [2.03879453, 0.696317478, 1.534115834],
    [2.02468199, 0.696474013, 1.53430006],
    [2.03680342, 0.696619015, 1.534470752],
    [2.01548481, 0.696753715, 1.53462935],
    [2.02715242, 0.696879171, 1.534777095],
    [1.99638256, 0.696996305, 1.534915064],
    [2.05800345, 0.697105917, 1.535044196],
    [1.99825469, 0.69720871, 1.535165314],
    [2.04392881, 0.697305301, 1.535279142],
    [2.01664342, 0.697396234, 1.535386318],
    [2.05066745, 0.697481993, 1.535487409],
    [2.02855101, 0.697563006, 1.535582919],
    [2.04871795, 0.697639658, 1.535673297],
    [2.01842427, 0.697712292, 1.535758947],
    [2.04822738, 0.697781214, 1.53584023]
])

# Extract features
X = data[:, 1].reshape(-1, 1)  # Vectorization percentage
y_observed = data[:, 0]  # Observed performance gain
y_expected = data[:, 2]  # Expected performance gain

# Compute residuals
residuals = y_observed - y_expected

# Define Gaussian Process Regression with constraints
kernel = C(1.0, (1e-3, 1e3)) * RBF(length_scale=0.1, length_scale_bounds=(1e-2, 10)) + WhiteKernel(noise_level=0.1)
gpr = GaussianProcessRegressor(kernel=kernel, alpha=0.02, n_restarts_optimizer=10)

# Fit GPR model on residuals
gpr.fit(X, residuals)

# Predict residuals for full range
X_pred = np.linspace(X.min(), X.max(), 100).reshape(-1, 1)
residuals_pred, sigma = gpr.predict(X_pred, return_std=True)
y_corrected = np.interp(X_pred.ravel(), X.ravel(), y_expected) + residuals_pred


X_pred_10_90 = np.linspace(0.10, 0.90, 100).reshape(-1, 1)
print("X_pred_10_90")
print(X_pred_10_90)

residuals_pred_10_90, sigma_10_90 = gpr.predict(X_pred_10_90, return_std=True)
print("residuals_pred_10_90")
print(residuals_pred_10_90)

# Define the theoretical equation
def theoretical_speedup(F_AVX2, S_AVX2=2.0):
    return 1 / ((1 - F_AVX2) + (F_AVX2 / S_AVX2))

# Compute theoretical expectations for the training data
y_expected_amd = theoretical_speedup(X_pred_10_90.ravel())
print("y_expected")
print(y_expected_amd)

#y_corrected_10_90 = np.interp(X_pred_10_90.ravel(), X.ravel(), y_expected) + residuals_pred_10_90
y_corrected_10_90 = y_expected_amd + residuals_pred_10_90


# **Plot Full Range**
plt.figure(figsize=(8, 5))
plt.plot(X_pred, np.interp(X_pred.ravel(), X.ravel(), y_expected), 'r--', label="Expected Gain")
plt.scatter(X, y_observed, color="black", label="Observed Gain")
plt.plot(X_pred, y_corrected, color="blue", label="Corrected Prediction")
plt.fill_between(X_pred.ravel(), y_corrected - 1.96 * sigma, y_corrected + 1.96 * sigma,
                 alpha=0.3, color="blue", label="Confidence Interval (95%)")
plt.xlabel("Percentage of Vectorization")
plt.ylabel("Performance Gain (AVX2 - AVX)")
plt.legend()
plt.title("GPR for Performance Modeling (Full Range)")
plt.show()

# **Plot 10% to 90% range**
plt.figure(figsize=(8, 5))
plt.plot(X_pred_10_90,y_expected_amd, 'r--', label="Expected Gain")
plt.plot(X_pred_10_90, y_corrected_10_90, color="blue", label="Corrected Prediction")
plt.fill_between(X_pred_10_90.ravel(), y_corrected_10_90 - 1.96 * sigma_10_90,
                 y_corrected_10_90 + 1.96 * sigma_10_90, alpha=0.3, color="blue", label="Confidence Interval (95%)")
plt.xlabel("Percentage of Vectorization (10% to 90%)")
plt.ylabel("Performance Gain (AVX2 - AVX)")
plt.legend()
plt.title("GPR for Performance Modeling (10% to 90% Range)")
plt.show()

# Print optimized kernel parameters
print("Optimized Kernel Parameters:", gpr.kernel_)

