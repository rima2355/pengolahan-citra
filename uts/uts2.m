pkg load image  % pastikan ini aktif

% Baca gambar grayscale
img = imread('bunga.jpg');
if size(img,3) == 3
  img = rgb2gray(img);  % jika masih RGB, ubah ke grayscale
end

% Fungsi kuantisasi ke N level
function out = kuantisasi(img, level)
  step = 256 / level;
  out = floor(double(img) / step) * step;
  out = uint8(out);
end

% Kuantisasi ke 2, 4, dan 8 tingkat keabuan
img_2 = kuantisasi(img, 2);
img_4 = kuantisasi(img, 4);
img_8 = kuantisasi(img, 8);

% Tampilkan hasilnya
figure('Name', 'Kuantisasi Grayscale');
subplot(2,2,1), imshow(img), title('Asli (256 level)');
subplot(2,2,2), imshow(img_2), title('Kuantisasi 2 Level');
subplot(2,2,3), imshow(img_4), title('Kuantisasi 4 Level');
subplot(2,2,4), imshow(img_8, []), title('Kuantisasi 8 Level');


