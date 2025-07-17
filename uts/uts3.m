pkg load image

% Baca gambar gelap
img = imread('gelap.jpg');
if size(img,3) == 3
  img_gray = rgb2gray(img);
% ubah ke grayscale
else
  img_gray = img;
end

% Penyesuaian brightness: tambahkan nilai ke piksel
bright_img = img_gray + 50;  % nilai bisa disesuaikan
bright_img(bright_img > 180) = 180;  % pastikan tidak lebih dari 255
bright_img = uint8(bright_img);

% Tampilkan citra dan histogram
figure('Name', 'Peningkatan Kecerahan');
subplot(2,2,1), imshow(img_gray), title('Citra Asli (Gelap)');
subplot(2,2,2), imhist(img_gray), title('Histogram Asli');

subplot(2,2,3), imshow(bright_img), title('Citra Setelah Brightness +50');
subplot(2,2,4), imhist(bright_img), title('Histogram Setelah Brightness');


