%% This is the script crested by RC in Jan of 2024 to test the performance of CMG method submitted to PoF


clear
close all


%% Read image
I_crest1 = imread('TestImage_Crest1.png');   
I_crest2 = imread('TestImage_Crest2.png');     
I_gauges = imread('TestImage_Gauges.png');      
I_missing = imread('TestImage_NoMeniscus.png');


%% Create a ROI
recPo1 = [300 80 2100-300 550]; 
recPo2 = [300 80 1400-300 550]; 

%% Surface detection case 1: This case is for a steep, non-breaking wave passing through the middle part of the ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_crest1, recPo1, 5, 3);
figure(1); clf; 
imshow(I_crest1)
hold on
rectangle('Position',recPo1,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'--c','linewidth',1.5)



%% Surface detection case 2: This case is for a steep, non-breaking wave passing through the right part of the ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_crest2, recPo1, 5, 3);
figure(2); clf; 
imshow(I_crest2)
hold on
rectangle('Position',recPo1,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'--c','linewidth',1.5)




%% Surface detection case 3: This case is for a steep, non-breaking wave passing through two wave gauges
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_gauges, recPo2, 5, 3);
figure(1); clf; 
imshow(I_gauges)
hold on
rectangle('Position',recPo2,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'--c','linewidth',1.5)



%% Surface detection case 4: This case is for a steep, non-breaking wave where its meniscus disappears 
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_missing, recPo2, 5, 3);
figure(1); clf; 
imshow(I_missing)
hold on
rectangle('Position',recPo2,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'--c','linewidth',1.5)
