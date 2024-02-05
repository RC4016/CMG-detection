%% This is the script crested by RC in Jan of 2024 to test the performance of CMG method submitted to PoF
clear
close all


%% Read image
I_crest1 = imread('TestImage_Crest1.png');   
I_crest2 = imread('TestImage_Crest2.png');     
I_gauges = imread('TestImage_Gauges.png');      
I_missing = imread('TestImage_NoMeniscus.png');
I_Tian2010 = imread('TestImage_Tian2010.png');
I_Rapp1990 = imread('TestImage_Rapp1990.png');
I_Rapp1990_2 = imread('TestImage_Rapp1990_2.png');
I_Alberello2018 = imread('TestImage_Alberello2018.png');
I_CC2020 = imread('TestImage_Craciunescu2020.png');
I_Lim2015 = imread('TestImage_Lim2015.png');


%% Surface detection case 1: This case is for a steep, non-breaking wave passing through the middle part of the ROI
recPo1 = [300 80 2100-300 550]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_crest1, recPo1, 5, 3);
figure(1); clf; 
imshow(I_crest1)
axis on
hold on
rectangle('Position',recPo1,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.g','linewidth',1.5)



%% Surface detection case 2: This case is for a steep, non-breaking wave passing through the right part of the ROI
recPo2 = [300 80 2100-300 550]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_crest2, recPo2, 5, 3);
figure(2); clf; 
imshow(I_crest2)
axis on
hold on
rectangle('Position',recPo2,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.g','linewidth',1.5)




%% Surface detection case 3: This case is for a steep, non-breaking wave passing through two wave gauges
recPo3 = [300 80 1400-300 550]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_gauges, recPo3, 5, 3);
figure(3); clf; 
imshow(I_gauges)
hold on
rectangle('Position',recPo3,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.g','linewidth',1.5)



%% Surface detection case 4: This case is for a steep, non-breaking wave where its meniscus disappears 
recPo4 = [300 80 1400-300 550]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_missing, recPo4, 5, 3);
figure(4); clf; 
imshow(I_missing)
axis on
hold on
rectangle('Position',recPo4,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.g','linewidth',1.5)


%% Surface detection case 5: This case is a snapshot of Figure 3 from Tian et al (2010) Journal of Fluid Mechanics 
recPo5 = [40 25 325-40 130-25]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_Tian2010, recPo5, 5, 3);
figure(5); clf; 
imshow(I_Tian2010)
axis on
hold on
rectangle('Position',recPo5,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.m','linewidth',1.5)


%% Surface detection case 6: This case is a snapshot of Figure 8 from Rapp and Melville (1990) Philos Trans Royal Soc Lond A: Math Phys Eng Sci
recPo61 = [11 9 138-11 85-9]; % Create a ROI
[j_pixel1, i_pixel1, ~] = fSurfacePixelDetection_RC_vPoF(I_Rapp1990, recPo61, 5, 3);
recPo62 = [275 65 380-275 85-65]; % Create a ROI
[j_pixel2, i_pixel2, ~] = fSurfacePixelDetection_RC_vPoF(I_Rapp1990, recPo62, 5, 3);
figure(6); clf; 
imshow(I_Rapp1990)
axis on
hold on
rectangle('Position',recPo61,'linewidth',3,'EdgeColor','r')  
plot(i_pixel1, j_pixel1,'-.g','linewidth',1.5)
rectangle('Position',recPo62,'linewidth',3,'EdgeColor','r')  
plot(i_pixel2, j_pixel2,'-.g','linewidth',1.5)


%% Surface detection case 7: This case is a snapshot of Figure 10 from Rapp and Melville (1990) Philos Trans Royal Soc Lond A: Math Phys Eng Sci
recPo7 = [84 55 320-84 110-55]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_Rapp1990_2, recPo7, 5, 3);
figure(7); clf; 
imshow(I_Rapp1990_2)
axis on
hold on
rectangle('Position',recPo7,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.g','linewidth',1.0)


%% Surface detection case 8: This case is a snapshot of Figure 7 from Alberello et al (2018) Ocean Engineering
recPo8 = [67 60 326-67 155-60]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_Alberello2018, recPo8, 5, 3);
figure(8); clf; 
imshow(I_Alberello2018)
axis on
hold on
rectangle('Position',recPo8,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.b','linewidth',1.5)


%% Surface detection case 9: This case is a snapshot of Figure 15 from Craciunescu and Christou (2020) Applied Ocean Research
recPo9 = [50 15 437-50 130-15]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_CC2020, recPo9, 5, 3);
figure(9); clf; 
imshow(I_CC2020)
axis on
hold on
rectangle('Position',recPo9,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.g','linewidth',1.5)


%% Surface detection case 10: This case is a snapshot of Figure 5 from Lim et al (2015) Journal of Geophysical Research: Oceans
recPo10 = [164 80 660-164 300-80]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_Lim2015, recPo10, 5, 3);

recPo10_1 = [835 75 954-835 163-75]; % Create a ROI
[j_pixel_1, i_pixel_1, ~] = fSurfacePixelDetection_RC_vPoF(I_Lim2015, recPo10_1, 5, 3);

figure(10); clf; 
imshow(I_Lim2015)
axis on
hold on
rectangle('Position',recPo10,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.b','linewidth',1.5)
rectangle('Position',recPo10_1,'linewidth',3,'EdgeColor','r')  
plot(i_pixel_1, j_pixel_1,'-.g','linewidth',1.5)


%% Surface detection case 11: This case is a snapshot of Figure 5 from Lubin et al (2019) European Journal of Mechanics / B Fluids 
recPo11 = [212 167 404-212 234-167]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_Lubin2019, recPo11, 5, 3);
figure(11); clf; 
imshow(I_Lubin2019)
axis on
hold on
rectangle('Position',recPo11,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.g','linewidth',1.5)


%% Surface detection case 12: This case is a snapshot of Figure 4 from Perlin et al (1996) Physics of Fluids 
recPo12 = [38 120 291-38 220-120]; % Create a ROI
[j_pixel, i_pixel, ~] = fSurfacePixelDetection_RC_vPoF(I_Perlin1996, recPo12, 5, 3);
figure(12); clf; 
imshow(I_Perlin1996)
axis on
hold on
rectangle('Position',recPo12,'linewidth',3,'EdgeColor','r')  
plot(i_pixel, j_pixel,'-.c','linewidth',1.5)

