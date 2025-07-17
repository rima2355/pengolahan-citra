pkg load image

% 1. Baca gambar bertekstur
img = imread('sirih.jpg');
if size(img,3) == 3
  img_gray = rgb2gray(img);
else
  img_gray = img;
end

% 2. Konversi ke double
img_double = double(img_gray);

% 3. Buat versi blur (low-pass) dengan filter rata-rata 3x3
h = fspecial('average', [3 3]);
img_blur = imfilter(img_double, h);

% 4. Terapkan High-Boost filtering (misal: A = 2.5)
A = 2.5;
img_highboost = A * img_double - img_blur;

% 5. Normalisasi dan ubah ke uint8 agar bisa ditampilkan
img_highboost = uint8(mat2gray(img_highboost) * 255);

% 6. Tampilkan hasil
figure('Name', 'High-Boost Filtering');
subplot(1,2,1), imshow(img_gray), title('Asli (Bertekstur)');
subplot(1,2,2), imshow(img_highboost), title(['High-Boost A = ', num2str(A)]);

