%TUGAS PRATIKUM 2%

pkg load image; %pastikan package image sudah dimuat

%HISTOGRAM%
Img = imread('C:\Pengolahan Citra 4\gambar\doraemon.jpg');
img = im2uint8 (img);
figure;
imhist(img);

%pisahkan channel RGB
R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);

%tamppilkan histogram
figure;
subplot(3,1,1);
imhist(R);
title(' Histogram Merah (Red)');
xlim([0 255]);

subplot(3,1,2);
imhist(B);
title('Histogram Biru(Blue)');
xlim([0 255]);

%2 meningkatkan kecerahan%
imgGray = rgb2gray(img);
imgCerah = imgGray+700 ;
figure;
imshow(imgCerah);
