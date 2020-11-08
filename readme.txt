This code can be downloaded from https://github.com/vupil/Optimal-Filtering-EIV-DIPCA

We provide the documentation here but please refer the dipca_eivkf_demo.m file to
understand the usage of this function. We have also provided a readme.txt
file to understand the usage and working of this function. You can type
the following commands to get the documentation in Matlab: 
1) doc dipca_eivkf_ref
2) help dipca_eivkf_ref

This function requires the following inputs:
Inputs: 1) zn: a matrix of dimension Nx2 with 1st and 2nd columns
               being the output and input variables, respectively. 
        2) L : an integer, denotes the lag or stacking order up to which you would like
               to stack the lagged inputs and outputs variable. Please note that
               chose L should be greater than order of difference equation + 1
               for identifiability to be satisfied. 
        3) guessed_order: a scalar; denotes the guessed system order
        4) plot_autocorr: a boolean; indicates if the ACF plot should be
        generated (default is true)

The function returns the following variables: 
Outputs: 
        1) eps: a vector of dimension 1xN corresponding to the optimal residuals computed using
        the EIV-Kalman Filter algorithm; the residuals contain
        information about the goodness of the estimated model parameters
        (including the order)

        2) ystr: a vector of dimension 1xN containing the optimal filtered
        (noise-free) estimates of the output measurements

        3) ustr: a vector of dimension 1xN containing the optimal filtered
        (noise-free) estimates of the input measurements

        4) noise_var: a 1x2 vector. 
                      noise_var(1,1) is the estimated output noise variance and 
                      noise_var(1,2) is the estimated input noise variance
        5) eigval_f: a 1x(2*(L+1)) vector consisting of the
                      eigenvalues in ascending order, where L is supplied 
                      in inputs to this function. 
                      The eigenvalues can be used to estimate the order
                      of difference equation using eta = L-d+1, where d is the number of unity eigenvalues. 
                      The first few eigenvalues are expected to be unity.
                      For example, if you supply L = eta_guess+1, you will get 2
                      unity eigenvalues, where eta_guess is the system order (Assumed to be unknown). 
                      If you supply L = eta_guess+2, you will get 3 unity
                      eigenvalues. Hence the number of unity eigenvalues
                      can be used to detect the system order - eta_guess. Refer
                      an example in the demo file for more information. 
        6) out_par: a vector of dimension 1x(L+1). 
                     It contains the coefficients of lagged output variables in the difference equation
                     in the form [a_0 a_1 a_2 ... a_{L}], where we
                     normalize a_0 = 1. a_i is the coefficient of y[k-i]
        7) inp_par:  a vector of dimension 1x(L+1). 
                     It contains the coefficients of lagged input variables in the difference equation
                     in the form [b_0 b_1 b_2 ... b_{L}]. 
                     b_i is the coefficient of u[k-i]

You could refer to the following papers for further reference. Please cite them if
you are using this code and feel free to contact the first author(s) if you
have any queries.
1) Optimal Filtering and Residual Analysis in Errors-in-Variables Model Identification, 
   Vipul Mann, Deepak Maurya, Arun K. Tangirala, Shankar Narasimhan, 2020, Industrial & Engineering Chemistry Research, 59(5), pp.1953-65
   Link: https://pubs.acs.org/doi/abs/10.1021/acs.iecr.9b04561
2) Identification of Errors-in-Variables models using dynamic iterative principal component analysis,
   Deepak Maurya, Arun K. Tangirala, Shankar Narasimhan, 2018, Industrial & Engineering Chemistry Research, 57(35), pp.11939-54
   Link: https://pubs.acs.org/doi/abs/10.1021/acs.iecr.8b01374
