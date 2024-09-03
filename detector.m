function [s1, s2, s3] = detector(x1, x2, x3, sigmaZ1, sigmaZ2, sigmaZ3)

    alpha = 0.12;
    lambda_1 = sigmaZ1* norminv(1-alpha); %for Prob H: N(0, NSig)
    lambda_2 = sigmaZ2* norminv(1-alpha); %for Prob H: N(0, NSig)
    lambda_3 = sigmaZ3* norminv(1-alpha); %for Prob H: N(0, NSig)

    s1 = (x1 > lambda_1);
    s2 = (x2 > lambda_2);
    s3 = (x3 > lambda_3);

end