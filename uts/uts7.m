pkg load image

% 1. Baca gambar
img = imread('papan.png');

% 2. Rotasi gambar agar tegak lurus (misalnya -5 derajat)
img_rotated = imrotate(img, -7, 'bilinear');

% 3. Perbesar gambar hasil rotasi agar teks lebih jelas
img_zoom = imresize(img_rotated, 2.0, 'bilinear');

% 4. Tampilkan gambar asli dan rotasi dalam satu figure
figure('Name', 'Asli dan Rotasi');
subplot(1,2,1), imshow(img), title('Gambar Asli (Miring)');
subplot(1,2,2), imshow(img_rotated), title('Setelah Rotasi');

% 5. Tampilkan hasil zoom di figure terpisah dan lebih besar
figure('Name', 'Hasil Zoom Lebih Besar');
imshow(img_zoom);
title('Gambar Diperbesar (2x) - Tampilan Besar');




