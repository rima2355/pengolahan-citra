pkg load image

% 1. Baca gambar noise
img = imread('wajah.jpeg');
if size(img,3) == 3
  img_gray = rgb2gray(img);
% konversi ke grayscale
else
  img_gray = img;
end

% 2. Terapkan filter median 3x3
img_median = medfilt2(img_gray, [3 3]);

% 3. Terapkan filter rata-rata (mean filter)
kernel = ones(3,3) / 9;
img_mean = imfilter(img_gray, kernel);

% 4. Tampilkan hasil
figure('Name','Perbandingan Median vs Mean');
subplot(2,2,1), imshow(img_gray), title('Gambar Asli (Noisy)');
subplot(2,2,2), imshow(img_median), title('Filter Median 3x3');
subplot(2,2,3), imshow(img_mean), title('Filter Mean 3x3');

