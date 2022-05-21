    function [f1,im1]=pnsr(f1,im1)
        im1 = uint8(im1);
        f1 = uint8(f1);
        ourPSNR = psnr(f1,im1);
        ourSSIM = ssim(f1, im1);
%         ourFSIM = FeatureSIM(im1, f1);
%         d = sum((im1(:)-f1(:)).^2) / prod(size(im1));
%         ourPSNR = 10*log10(255*255/d);
        fprintf('\n peak-to-signal ratio is %0.4f',ourPSNR);
        fprintf('\n structure-similarity index measurement is %0.4f',ourSSIM);
%         fprintf('feature similarity index measurement  : %f',ourFSIM)
        fprintf('\n')
    end