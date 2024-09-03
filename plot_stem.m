function plot_stem(s1_t3, s2_t3, s3_t3)

    %n = 1:1:d;
    subplot(3,1,1);
    stem(1:100,s1_t3)
    title('detection result at SNR = -10')
    xlabel('N','Interpreter','latex');
    ylabel('Absence/ Presence');
    ylim([0 1.2])

    subplot(3,1,2); 
    stem(1:100,s2_t3)
    title('detection result at SNR = 0')
    xlabel('N','Interpreter','latex');
    ylabel('Absence/ Presence');
    ylim([0 1.2])

    subplot(3,1,3); 
    stem(1:100,s3_t3)
    title('detection result at SNR = 10')
    xlabel('N','Interpreter','latex');
    ylabel('Absence/ Presence');
    ylim([0 1.2])

    set(gcf,'Position',[100 100 500 500])
end