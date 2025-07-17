pkg load image

% Baca gambar
img_rgb = imread('bayi.jpg');

% Konversi ke grayscale
img_gray = rgb2gray(img_rgb);

% Binarisasi otomatis
level = graythresh(img_gray);
img_bw = im2bw(img_gray, level);

% Tampilkan gambar RGB, grayscale, dan biner
figure('Name','Tampilan Gambar');
subplot(1,3,1), imshow(img_rgb), title('Citra RGB (Berwarna)');
subplot(1,3,2), imshow(img_gray), title('Citra Grayscale');
subplot(1,3,3), imshow(img_bw), title('Citra Biner');


