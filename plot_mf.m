function [] = plot_mf(x1,x2,x3)

    subplot(3,1,1);
    plot(x1)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Observations of $y_1$ after matched filtering, SNR = -10','Interpreter','latex');

    subplot(3,1,2); 
    plot(x2)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Observations of $y_2$ after matched filtering, SNR = 0','Interpreter','latex');

    subplot(3,1,3); 
    plot(x3)
    xlabel('N','Interpreter','latex');
    ylabel('Amplitude');
    title('Observations of $y_3$ after matched filtering, SNR = 10','Interpreter','latex');
    set(gcf,'Position',[100 100 500 500])

end