function [x1,x2,x3] = genSignals(si, theta, muZ, sigmaZ1, sigmaZ2, sigmaZ3)
   %x1 = theta*si + wgn(1,N,sigmaZ1^2) + muZ; %dBW
   %x2 = theta*si + wgn(1,N,sigmaZ2^2) + muZ; %dBW
   %x3 = theta*si + wgn(1,N,sigmaZ3^2) + muZ; %dBW
    x1 = theta.*si + (sigmaZ1* randn(1,100)) + muZ;
    x2 = theta.*si + (sigmaZ2* randn(1,100)) + muZ;
    x3 = theta.*si + (sigmaZ3* randn(1,100)) + muZ;
    
end 
