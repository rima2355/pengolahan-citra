pkg load image

% 1. Baca gambar papan catur
img = imread('kotak.jpg');

% 2. Ubah ke grayscale jika RGB
if size(img, 3) == 3
  img = rgb2gray(img);
end

% 3. Buat matriks transformasi affine (rotasi + skala + translasi)
theta = pi/8;       % rotasi 22.5 derajat
scale = 1.2;        % skala 1.2x
tx = 50; ty = 30;   % translasi ke kanan dan bawah

T = [scale*cos(theta), -scale*sin(theta), 0;
     scale*sin(theta),  scale*cos(theta), 0;
     0,                 0,                1];

% Buat struktur transformasi untuk imtransform
tform = maketform('affine', T);  % <- ini cara Octave

% 4. Terapkan transformasi affine
img_trans = imtransform(img, tform, 'bilinear', 'XData', [1 size(img,2)], 'YData', [1 size(img,1)]);

% 5. Tampilkan hasil
figure('Name', 'Transformasi Affine Papan Catur');
subplot(1,2,1), imshow(img), title('Gambar Asli');
subplot(1,2,2), imshow(img_trans), title('Setelah Transformasi Affine');

