clc 
clear all

%% Task 1,2
N = 100;
SNR = [-10, 0, 10]; %dB
theta_deg = 45;
si = ones(1, N);
sigma_s = (si*si')/N;
muZ = 0;
sigmaZ = (theta_deg .* sigma_s)./ (10.^(SNR/20));

%%Generate the signal
[x1_deg, x2_deg, x3_deg] = genSignals(si, theta_deg, muZ, sigmaZ(1), sigmaZ(2), sigmaZ(3)); %xt - N(theta, sigma^2)

%%Under K, using the estimated theta
theta_est = [sum(x1_deg)/N sum(x2_deg)/N sum(x3_deg)/N];
sigmaZ_est = (theta_est .* sigma_s)./ (10.^(SNR/20));

%%Generate the signal using the estimated theta: x = \hat{\theta} s + n 
x1_est = theta_est(1).*si + (sigmaZ_est(1)* randn(1,100)) + muZ;
x2_est = theta_est(2).*si + (sigmaZ_est(2)* randn(1,100)) + muZ;
x3_est = theta_est(3).*si + (sigmaZ_est(3)* randn(1,100)) + muZ;

%plot_task1(x1_est, x2_est, x3_est)

%%Detection
[s1, s2, s3] = detector(x1_est, x2_est, x3_est, sigmaZ_est(1), sigmaZ_est(2), sigmaZ_est(3));
%plot_stem(s1, s2, s3)
fprintf('Task 1, 2 DONE \n');

%% ROC Plot
%ROC(theta_est, sigmaZ_est(1), sigmaZ_est(2), sigmaZ_est(3))

%% Task 3
theta_t3_deg = [45*ones(1,50) zeros(1,50)];
init_task3(N)

[x1_T3_deg, x2_T3_deg, x3_T3_deg] = genSignals(si, theta_t3_deg, muZ, sigmaZ(1), sigmaZ(2), sigmaZ(3)); %xt - N(theta, sigma^2)
%plot_task1(x1_T3_deg, x2_T3_deg, x3_T3_deg)

%%Detection
[s1_t3, s2_t3, s3_t3] = detector(x1_T3_deg, x2_T3_deg, x3_T3_deg, sigmaZ(1), sigmaZ(2), sigmaZ(3));
%plot_task3(theta_t3_deg, x1_T3_deg, x2_T3_deg, x3_T3_deg, s1_t3, s2_t3, s3_t3);

%fprintf('%f percent of presence at SNR = -10.\n',(sum(s1_t3)*100)/N);
%fprintf('%f percent of presence at SNR =   0.\n',(sum(s2_t3)*100)/N);
%fprintf('%f percent of presence at SNR =  10.\n',(sum(s3_t3)*100)/N);
fprintf('Task 3 DONE \n');

%% Task 5
w0  = 0.125;
phi = 0;
i = 1:1:100;
si_t5 = sin(w0*i + phi);
Pow_si_t5 = ((theta_deg^2) * (si_t5* si_t5'))/ N;
sigma_t5 = sqrt(Pow_si_t5./db2pow(SNR));

[x1_t5deg, x2_t5deg, x3_t5deg] = genSignals(si_t5, theta_deg, muZ, sigma_t5(1), sigma_t5(2), sigma_t5(3)); %xt - N(theta, sigma^2)
%plot_task1(x1_t5deg, x2_t5deg, x3_t5deg)

%%Detection w/o Matched filter
[s1_t5, s2_t5, s3_t5] = detector(x1_t5deg, x2_t5deg, x3_t5deg, sigma_t5(1), sigma_t5(2), sigma_t5(3));
%plot_stem(s1_t5, s2_t5, s3_t5)

%%Matched filter Signal
y1_t5deg = si_t5.* x1_t5deg;
y2_t5deg = si_t5.* x2_t5deg;
y3_t5deg = si_t5.* x3_t5deg;

%%Matched filter gain
mfgain = si_t5*si_t5';
%%SNR has to be improved from the matched filter
SNR_mf = db2pow(SNR)*mfgain;
%plot_mf(y1_t5deg, y2_t5deg, y3_t5deg)
sigma_mf_t5 = (theta_deg * sqrt(mfgain))./ SNR_mf;

%%Detection w/ Matched filter
[s1_mf, s2_mf, s3_mf, l1, l2, l3] = detector_mf(y1_t5deg, y2_t5deg, y3_t5deg, sigma_mf_t5(1), sigma_mf_t5(2), sigma_mf_t5(3), si_t5);
%plot_stem(s1_mf, s2_mf, s3_mf)
fprintf('Task 5 DONE \n');

%ROC_mf(theta_deg,  sigma_mf_t5(1), sigma_mf_t5(2), sigma_mf_t5(3), si_t5)
