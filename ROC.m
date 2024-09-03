%% Task 4
function [] = ROC(theta, sigmaZ1, sigmaZ2, sigmaZ3)
    
    P_FA = 0:0.01:1;

    for cnt = 1:1:101
        P_D_1(cnt) = 1 - normcdf(norminv(1-P_FA(cnt)) - theta(1)/sigmaZ1); %P_FA = 0.12
        P_D_2(cnt) = 1 - normcdf(norminv(1-P_FA(cnt)) - theta(2)/sigmaZ2); %P_FA = 0.12
        P_D_3(cnt) = 1 - normcdf(norminv(1-P_FA(cnt)) - theta(3)/sigmaZ3); %P_FA = 0.12
    end
    
    plot(P_FA,P_D_1,'--',...
         P_FA,P_D_2,...
         P_FA,P_D_3,'--')
    xlim([-0.05 1.05])
    ylim([-0.05 1.05])
    ylabel('$P_{D}$','Interpreter','latex');
    xlabel('$P_{FA}$','Interpreter','latex');
    yticks([0 0.2 0.4 0.6 0.8 1])
    xticks([0 0.2 0.4 0.6 0.8 1])
    title('ROC Curve');
    grid on;
    legend({'SNR = -10', 'SNR = 0', 'SNR = 10'},'Location','southeast')
    %matlab2tikz('ROC.tex')
end