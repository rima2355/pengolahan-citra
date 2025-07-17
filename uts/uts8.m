pkg load image

% 1. Baca gambar
img = imread('wajah.jpeg');
if size(img,3) == 3
  img = rgb2gray(img);  % ubah ke grayscale untuk efek sederhana
end

% 2. Siapkan ukuran
[M, N] = size(img);
[x, y] = meshgrid(1:N, 1:M);

% 3. Ripple effect
ripple_strength = 10;  % besar efek ripple
ripple_freq = 0.05;    % frekuensi gelombang
xr = x + ripple_strength * sin(2 * pi * ripple_freq * y);
yr = y;

% 4. Interpolasi citra baru
img_ripple = interp2(double(img), xr, yr, 'linear');
img_ripple(isnan(img_ripple)) = 0;  % tangani NaN di pinggir
img_ripple = uint8(img_ripple);

% 5. Tampilkan
figure('Name', 'Ripple Effect');
subplot(1,2,1), imshow(img), title('Citra Asli');
subplot(1,2,2), imshow(img_ripple), title('Efek Ripple');

