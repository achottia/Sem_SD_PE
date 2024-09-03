function plot_task3(theta_t3_deg,x1_T3,x2_T3,x3_T3, s1_t3, s2_t3, s3_t3)

    %n = 1:1:d;
    subplot(4,1,1);
    stairs(theta_t3_deg)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('NRZ Signal using $\theta$ = 45$^{\circ}$','Interpreter','latex');
    yticks([0 45])
    ylim([-2 47])

    subplot(4,1,2);
    stem(1:100,s1_t3)
    title('detection result at SNR = -10')
    xlabel('N','Interpreter','latex');
    ylabel('Absence/ Presence');
    ylim([0 1.2])

    subplot(4,1,3); 
    stem(1:100,s2_t3)
    title('detection result at SNR = 0')
    xlabel('N','Interpreter','latex');
    ylabel('Absence/ Presence');
    ylim([0 1.2])

    subplot(4,1,4); 
    stem(1:100,s3_t3)
    title('detection result at SNR = 10')
    xlabel('N','Interpreter','latex');
    ylabel('Absence/ Presence');
    ylim([0 1.2])

    set(gcf,'Position',[100 100 900 700])
    %matlab2tikz('task3b.tex')

    figure

    subplot(3,1,1);
    plot(x1_T3)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Signal $x_1$, SNR = -10','Interpreter','latex');

    subplot(3,1,2);
    plot(x2_T3)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Signal $x_2$, SNR = 0','Interpreter','latex');

    subplot(3,1,3);
    plot(x3_T3)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Signal $x_3$, SNR = 10','Interpreter','latex');
    ylim([-5 50])
    
    %matlab2tikz('3_sig.tex')
end