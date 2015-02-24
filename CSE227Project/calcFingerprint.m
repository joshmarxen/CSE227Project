function [F, ignored] = calcFingerprint(images)

    % given a list of paths to images, calculates and returns the 
    % PRNU fingerprint of the camera which took each image
    
    cur_im = imread(images{1});
    [R, C, ~] = size(cur_im);
    channels = 3;
    F = zeros(R, C, channels);
    
    numerator = double(zeros(R, C, 3));
    denominator = double(zeros(R, C, 3));
    
    ignored = {};
    
    I = size(images);
    for i = 1:I
        
        cur_im = double(imread(images{i}));
        
        % check dimensions, make sure there are three channels
        [R2, C2, channels2] = size(cur_im);
        if R2 ~= R | C2 ~= C | channels2 ~= 3
            %['matching images with dimensions ' num2str(R) 'x' num2str(C) 'x' num2str(channels)]
            %['image ' directory '\' images(i).name ' has dimensions ' num2str(R2) 'x' num2str(C2) 'x' num2str(channels2)] 
            ignored = [ignored; images{i}];
            continue;
        end
        
        N = getNoise(cur_im);
        
        % update numerator
        %numerator(:,:,1) = numerator(:,:,1)+( rn.*cur_im(:,:,1) );
        %numerator(:,:,2) = numerator(:,:,2)+( gn.*cur_im(:,:,2) );
        %numerator(:,:,3) = numerator(:,:,3)+( bn.*cur_im(:,:,3) );
        numerator = numerator + N.*cur_im;
        
        % update denominator
        %denominator(:,:,1) = denominator(:,:,1)+( cur_im(:,:,1).*cur_im(:,:,1) );
        %denominator(:,:,2) = denominator(:,:,2)+( cur_im(:,:,2).*cur_im(:,:,2) );
        %denominator(:,:,3) = denominator(:,:,3)+( cur_im(:,:,3).*cur_im(:,:,3) );
        denominator = denominator + cur_im.*cur_im;
    end
    
    %rF = numerator(:,:,1)./denominator(:,:,1);
    %gF = numerator(:,:,2)./denominator(:,:,2);
    %bF = numerator(:,:,3)./denominator(:,:,3);
    
    %F = 0.3*rF + 0.6*gF + 0.1*bF;
    F = numerator./denominator;

end