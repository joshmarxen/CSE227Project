function [N, R_den, G_den, B_den] = getNoise(I)
    
    % filter type
    FILTER_TYPE = 'bior3.7';
    LEVEL = 3;
    
    N = zeros(size(I));
    
    % convert image to grayscale
    %G = rgb2gray2(I);
    R = double(I(:,:,1));
    G = double(I(:,:,2));
    B = double(I(:,:,3));
    [t, s, k] = ddencmp('den', 'wv', R);
    R_den=wdencmp('gbl',R,FILTER_TYPE,LEVEL,t,s,k);
    %NR = R - R_den;
    N(:,:,1) = R - R_den;
    
    [t, s, k] = ddencmp('den', 'wv', G);
    G_den=wdencmp('gbl',G,FILTER_TYPE,LEVEL,t,s,k);
    %NG = G - G_den;
    N(:,:,2) = G - G_den;
    
    [t, s, k] = ddencmp('den', 'wv', B);
    B_den=wdencmp('gbl',B,FILTER_TYPE,LEVEL,t,s,k);
    %NB = B - B_den;
    N(:,:,3) = B - B_den;
    
    %N = 0.3*NR + 0.6*NG + 0.1*NB;
end