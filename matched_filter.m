function matched_filter(signal)

% Matched filtering
for j = 1:length(sigma_z)
    for i = 1:N
        % Perform correlation with the template
        correlation = sum(xd(max(1,i-N+1):i, j) .* fliplr(signal(max(1,N-i+1):N)));
        % Thresholding based on correlation result
        if correlation > 0
            detection_results(i, j) = theta_0; % Signal detected
        else
            detection_results(i, j) = 0; % Signal not detected
        end
    end
end

end