# Optimal-Filtering-EIV-DIPCA

This repository contains the implementation of the Errors-in-Variables (EIV) Kalman Filter based optimal filtering approach proposed in `Optimal Filtering and Residual Analysis in Errors-in-variables Model Identification`, Vipul Mann, Deepak Maurya, Arun K. Tangirala, Shankar Narasimhan, 2020, Industrial & Engineering Chemistry Research, 59(5), pp.1953-65. <a href="https://pubs.acs.org/doi/10.1021/acs.iecr.9b04561">[Paper]</a>.

This filtering approach has been shown to be optimal in the errors-in-variables framework where both the input and the output measurements are corrupted with Gaussian white noise. The residuals obtained using this approach are optimal, unique, and could be used for performing model validation. Moreover, the residual sequences could be used for performing fault-detection and diagnosis where the Dynamic PCA-based residual sequences are typically used which we have shown in our work to be sub-optimal and non-unique. 


If you are using this code, please cite the following papers:
- `Optimal Filtering and Residual Analysis in Errors-in-variables Model Identification`, Vipul Mann, Deepak Maurya, Arun K. Tangirala, Shankar Narasimhan, 2020, Industrial & Engineering Chemistry Research, 59(5), pp.1953-65. <a href="https://pubs.acs.org/doi/10.1021/acs.iecr.9b04561">[Paper]</a>

- `Identification of Errors-in-Variables models using dynamic iterative principal component analysis`, Deepak Maurya, Arun K. Tangirala, Shankar Narasimhan, 2018, Industrial & Engineering Chemistry Research, 57(35), pp.11939-54. <a href="https://pubs.acs.org/doi/abs/10.1021/acs.iecr.8b01374">[Paper]</a>
