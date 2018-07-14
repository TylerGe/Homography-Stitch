image_1 = double(imread('11.jpg'));
image_2 = double(imread('22.jpg'));
% gray_A = im2double(rgb2gray(image_1));
% gray_B = im2double(rgb2gray(image_2));
% [height_wrap, width_wrap,~] = size(image_A);
% [height_unwrap, width_unwrap,~] = size(image_B);
x_rec=[533,732,775,1392,114,1333,1305,1366;
    1188,742,1791,1661,1582,419,852,309];
y_rec=[1906,2106,2090,2705,1563,2722,2658,2764;
    1153,736,1738,1693,1478,377,836,255];
% H=[-0.000332089623069551,1.72548108028887e-05,-0.997654415171598;
%     8.02433996803142e-05,-0.000565320717200694,-0.0684457030372707;
%     9.11378295278378e-08,-6.19049061067130e-09,-0.000645768209503012];
newimage=zeros(4000,6000,3);
H=[0.000322452402372869,-2.16894697349004e-05,0.997334812889578;
    -8.24872194195763e-05,0.000556635359540225,0.0729550343464616;
    -9.18860829757077e-08,3.99632419665911e-09,0.000642548799099750];
 for i=1:2448
     for j=1:3264
          xy_cam=H*[i;j;1];
          newimage(round(xy_cam(1))+100,round(xy_cam(2))+100,:)=image_1(i,j,:);
     end
 end
% for i=1:8
%     x_reci=x_rec(2,i);
%     y_reci=x_rec(1,i);
%     image_2((x_reci-20):(x_reci+20),(y_reci-20):(y_reci+20),:)=0;
% end
imshow(uint8(newimage))
% imwrite(uint8(image_2),'reord_22.jpg');