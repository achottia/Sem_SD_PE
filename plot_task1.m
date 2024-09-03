function [] = plot_task1(x1,x2,x3)

    subplot(3,1,1);
    plot(x1)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Observations of $x_1$, SNR = -10','Interpreter','latex');

    subplot(3,1,2); 
    plot(x2)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Observations of $x_2$, SNR = 0','Interpreter','latex');

    subplot(3,1,3); 
    plot(x3)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Observations of $x_3$, SNR = 10','Interpreter','latex');

    set(gcf,'Position',[100 100 500 500])

end