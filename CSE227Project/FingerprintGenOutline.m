% Generate Fingerprints for half the data
% for camera c
    % for photo p
        % extract noise, store for later
            % convert image to grayscale
            % perform multilevel decomposition 
                % [C, S] = wavedec2(IMAGE, LEVEL, FILTER_THINGY)
                % experiment with various filter
            % denoise image
                % [thr, sorh, keepapp] = ddencmp('den', 'wv', IMAGE)
                % [Xcomp, CXC, LXC, PERF0, PERFL2] = wdencmp('gbl', C,S,
                % FILTER_THINGY, LEVEL, thr, sorh, keepapp);
            % noise = orig - denoised
    % average noise -> fingerprint for c

% Match noise against remaining fingerprints
% for photo p
    % extract noise
    % for camera c
        % calculate correlation between p and c
        % update best match
    % check best match against reality, calculate accuracy