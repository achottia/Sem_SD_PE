for i = 1:100
    N = 1000;
    SNR = [-10, 0, 10]; %dB
    SNR_mag = db2mag(SNR);
    theta_deg = 45;
    theta_rad = deg2rad(theta_deg);
    si = 1;
    sigma_s = si^2;
    muZ = 0;
    sigmaZ = sqrt((theta_rad.^2 .* sigma_s^2)./ (10.^(0.1*SNR)));

    [x1,x2,x3] = genSignals(N, si, theta_rad, muZ, sigmaZ(1), sigmaZ(2), sigmaZ(3));
    
    theta_est_1 = sum(x1)/N;
    theta_est_2 = sum(x2)/N;
    theta_est_3 = sum(x3)/N;
    
    theta_est_1_deg(i) = rad2deg(theta_est_1);
    theta_est_2_deg(i) = rad2deg(theta_est_2);
    theta_est_3_deg(i) = rad2deg(theta_est_3);
end

plot(1:100, theta_est_1_deg,...
     1:100, theta_est_2_deg,...
     1:100, theta_est_3_deg)
ylabel('$\theta$ in deg ($^{\circ}$)','Interpreter','latex');
xlabel('number of test','Interpreter','latex');
title('$\theta = 45 ^{\circ}$ for N = 1000','Interpreter','latex');
legend('SNR = -10', 'SNR = 0', 'SNR = 10')

err1 = rmse(theta_est_1_deg, theta_deg*ones(1,100));
err2 = rmse(theta_est_2_deg, theta_deg*ones(1,100));
err3 = rmse(theta_est_3_deg, theta_deg*ones(1,100));