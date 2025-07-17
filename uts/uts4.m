pkg load image

% 1. Baca gambar
img = imread('wajah.jpg');

% 2. Ubah ke grayscale jika perlu
if size(img,3) == 3
  img_gray = rgb2gray(img);
else
  img_gray = img;
end

% 3. Ekualisasi histogram
img_eq = histeq(img_gray);

% 4. Tampilkan citra sebelum dan sesudah
figure('Name', 'Histogram Equalization pada Foto Wajah');
subplot(2,2,1), imshow(img_gray), title('Sebelum Equalisasi');
subplot(2,2,2), imhist(img_gray), title('Histogram Sebelum');

subplot(2,2,3), imshow(img_eq), title('Setelah Equalisasi');
subplot(2,2,4), imhist(img_eq), title('Histogram Setelah');

