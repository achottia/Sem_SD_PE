function [] = plot_mesh(A_shift, NPer, MPer, rangeIndex, velocityIndex)
    %rangeIndex = 0:1:(NPer-1);
    %rangeIndex = rangeIndex * c0 / (2 * delta_f * NPer);
    %velocityIndex = -MPer/2:1:(MPer-1)/2;
    %velocityIndex = velocityIndex * c0 / (2 * fc * MPer * Ts);
    mesh(velocityIndex,rangeIndex,A_shift);
    %xlim([-500 500])                                        %reduce the size 
    xlabel('Speed (m/s)')
    ylabel('Range (m)')
end

