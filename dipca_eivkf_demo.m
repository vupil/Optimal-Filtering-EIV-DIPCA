% This is a demo file that shows a working example for the DIPCA-EIV Kalman Filter algorithm. If you are using this code, 
% please cite our following papers:
% 1) Optimal Filtering and Residual Analysis in Errors-in-Variables Model Identification, 
%    Vipul Mann, Deepak Maurya, Arun K. Tangirala, Shankar Narasimhan, 2020, Industrial & Engineering Chemistry Research, 59(5), pp.1953-65
%    Link: https://pubs.acs.org/doi/abs/10.1021/acs.iecr.9b04561
% 2) Identification of Errors-in-Variables models using dynamic iterative principal component analysis,
%    Deepak Maurya, Arun K. Tangirala, Shankar Narasimhan, 2018, Industrial & Engineering Chemistry Research, 57(35), pp.11939-54
%    Link: https://pubs.acs.org/doi/abs/10.1021/acs.iecr.8b01374
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The readme.txt file shows how the functions dipca_eivkf and dipca could
% be used. Please run the following commands to get their respective documentations in Matlab: 
% 1) doc dipca_eivkf_ref
% 2) help dipca_eivkf_ref

%% Data Generation
clc
clear all

% sample size
N = 2^10-1; 

% noise-free input
uk = idinput(N,'prbs',[0 1],[-1 1]);

% A few sample models to pick from:
% -------------------------------------------------------------------------

% 1. _________Second-order process_________
% noise-free output
% LTI system: y[k] + 0.4y[k-1] + 0.6y[k-5] = 1.4u[k-2] + 1.8u[k-2]

order=2;
y=zeros(1,N);
for i=(order+1):N
       y(i)=-0.4*y(i-1)-0.6*y(i-order)+1.4*uk(i-1)+1.8*uk(i-2);
end


% 2. _________Fifth-order process_________
% noise-free output
% LTI system: y[k] + 0.2y[k-1] + 0.6y[k-5] = 1.2u[k-2] + 1.6u[k-2]

% order=5;
% y=zeros(1,N);
% for i=(order+1):N
%        y(i)=-0.2*y(i-1)-0.6*y(i-order)+1.2*uk(i-1)+1.6*uk(i-2);
% end


%% Noise addition

noise_free = [y',uk]; 
z = noise_free ; % noise-free output and input data

variance = var(noise_free);


SNR = 10; % signal to noise ratio
n1 = normrnd(0,sqrt(variance(1)/SNR),N,1);
n2 = normrnd(0,sqrt(variance(2)/SNR),N,1);

n = [n1 n2];

zn = noise_free +n ; % noisy data ready which is supplied to the algorithm

%% Estimation of the EIV system and Residual Generation using EIV-KF

% the stacking order that is used for stacking lagged values of the input and output variables
% L should be high enough to satisfy the identifiability constraint, i.e
% L>= order + 1
L = 10; 

% maximum of input and output order (correct guess); 
% start with a small guess and keep incrementing the guessed_order until white (uncorrelated) residuals are obtained
guessed_order = 2;

% estimate the model using DIPCA and compute residuals using EIVKF
% algorithm; model validation established through white residuals; filtered
% input and output variables are also computed and returned 
[residuals, y_filtered, u_filtered, noise_var,eigval_f,out_par,inp_par] = dipca_eivkf(zn,L,guessed_order, true)


%% Two-tank Case Study
clc
clear all

% load the dataset
load('data_2tank.mat')

zn = [output_data, input_data];

zn = zn - mean(zn);

L=5;

guessed_order=1; % incorrect order (underestimated)
[residuals, y_filtered, u_filtered, noise_var,eigval_f,out_par,inp_par] = dipca_eivkf(zn,L,guessed_order, true)


guessed_order=2;  % correct order
[residuals, y_filtered, u_filtered, noise_var,eigval_f,out_par,inp_par] = dipca_eivkf(zn,L,guessed_order, true)

guessed_order=3; % incorrect order (overestimated)
[residuals, y_filtered, u_filtered, noise_var,eigval_f,out_par,inp_par] = dipca_eivkf(zn,L,guessed_order, true)
