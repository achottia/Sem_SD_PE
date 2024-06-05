function R = getSammpleCov(y)
%gets sammple covariance
% y size =  NR x K x M
    [n, K ,Ms] = size(y);
    R=zeros(n,n);
    for m = 1:1:Ms
        for k = 1:1:K
            R= R + y(:,k,m)* ctranspose(y(:,k,m));  % eq(17)
        
        end
    end
    R=R./(K*Ms);
end