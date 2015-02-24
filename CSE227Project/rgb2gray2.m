function [G, gmap] = rgb2gray2(I)

    I2 = double(I);
    Xrbg = 0.2990*I2(:,:,1) + 0.5870*I2(:,:,2)+0.114*I2(:,:,3);
    G = wcodemat(Xrbg,255);
    gmap = gray(255);

end