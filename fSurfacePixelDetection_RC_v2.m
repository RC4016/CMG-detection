%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% V2 is updated in Oct 2021 including the following changes compared to V1
% 1. x_in_pixel - the horizontal locations of the detected pixels are given
% 2. FS_candidates - original detection results
% 3. FS_in_pixel - final detection results after smoothing
%
% The original version was created by RC4016 in NOV 2020 to detect poxel surface
% 1. ProcessedImage - Image after undistortion and proceessed
% 2. Position - region of interest
% 3. mm - Top N largest values e.g. 5 8 2 
% 4. dif - maximum difference pixel +-3 3 12
% Hints: 3 and 4 must be on two extremes. It is found that:
%        general: [8 3]
%        bubbles: [20 5]
%        gauges:  [3 12] or [20  3|4|5]: one must work
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [FS_in_pixel, x_in_pixel, FS_candidates] = fSurfacePixelDetection_RC_v2(ProcessedImage, Position, mm, dif)

y_range = Position(2):Position(2)+Position(4);
x_range = Position(1):Position(1)+Position(3);
ProcessedImage_crop = ProcessedImage(y_range, x_range);
FS_candidates = [];

offset = 3;

for jj = 1:length(x_range)
    % absolute pixel
    Grad = abs(gradient(im2double(ProcessedImage_crop(:,jj))));
    [~,id] = maxk(Grad,mm);
    id = sort(id,'descend');
    n = 1;
    if jj ==1 
        [~,FS(jj,1)] = max(Grad);
    else 
        if abs( id(n) - FS(jj-1,:) ) > dif
            [~,n] = min( abs(id - FS(jj-1,:)) );
            if abs( id(n) - FS(jj-1,:) ) > dif
                id(n) = FS(jj-1,:);
            end
        end
        FS(jj,1) = id(n);
    end
    FS_candidates = [FS_candidates, id + Position(2) - offset];
end
FS = FS - offset;



%% gaussian smooth
nn = 30; 
FSS = smoothdata(FS,'gaussian',nn,'includenan');
dummy = smoothdata(FS,'sgolay',nn);
FSS(1:round(nn/10)) = dummy(1:round(nn/10));
FSS( round(1:round(nn/5+(3/4)*(nn/5)) )) = smooth( FSS( 1:round(nn/5+(3/4)*(nn/5)) ));

FS_in_pixel = FSS + Position(2) + 1;
x_in_pixel = reshape(x_range, length(x_range), 1);

return
%%
 
%  figure, imshow(ProcessedImage)
%  hold on
%  plot(PixelLocation_of_free_surface,'.b')
%  rectangle('Position',Position,'edgecolor',fClr(4))
end