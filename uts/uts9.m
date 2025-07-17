pkg load image

% 1. Baca gambar
img = imread('jalan.jpeg');

% 2. Jika citra RGB, konversi ke grayscale
if size(img,3) == 3
  img_gray = rgb2gray(img);
else
  img_gray = img;
end

% 3. Terapkan filter Gaussian (ukuran kernel 5x5, sigma = 5)
img_blur = imgaussfilt(img_gray, 5);
% sigma = 5 → makin besar, makin blur

% 4. Tampilkan hasil
figure('Name', 'Gaussian Blur');
subplot(1,2,1), imshow(img_gray), title('Citra Asli (Grayscale)');
subplot(1,2,2), imshow(img_blur), title('Setelah Gaussian Blur');

