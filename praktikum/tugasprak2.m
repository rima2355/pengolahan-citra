% tugas praktikum2
pkg load image;

% Membaca citra
img = imread('C:\rima\Pengolahan Citra 4\tugas2\emon.jpg');

% Pisahkan channel RGB
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Hitung histogram masing-masing channel
[countR, x] = imhist(R);
[countG, ~] = imhist(G);
[countB, ~] = imhist(B);

% Tampilkan gambar dan histogram gabungan RGB dalam satu figure
figure;

% Tampilkan gambar asli
subplot(1,2,1);
imshow(img);
title('Gambar Asli');

% Tampilkan histogram gabungan RGB
subplot(1,2,2);
plot(x, countR, 'r', x, countG, 'g', x, countB, 'b');
title('Histogram Gabungan RGB');
xlabel('Tingkat Intensitas');
ylabel('Jumlah Piksel');
xlim([0 255]);
legend('Merah', 'Hijau', 'Biru');
grid on;


%2. meningkatkan kecerahan%
imgray = rgb2gray(img);
cerah = imgray +100;
figure;
imshow (cerah);

%3. meregangkan kontras%
figure;
kont = 0.5*img;
imshow (kont);

%4. kombinasi kecerahan dan kontras%
komb = img - 10;
k = komb * 25;
figure ;
imshow (k);

%5. membalik citra%
balik = 255 - img;
imshow (balik);

%6. pemetaan nonlinier%
figure;
meta = log(1+double(img));
meta2 = im2uint8(mat2gray(meta));
imshow (meta2);

%7. Pemotongan aras keabuan%
function [Hasil] = potong(berkas, f1, f2)
Img = imread(berkas);
Img = rgb2gray(Img);
% Konversi ke grayscale
[tinggi, lebar] = size(Img);
Hasil = Img;

for baris = 1 : tinggi
    for kolom = 1 : lebar
        if Hasil(baris, kolom) <= f1
            Hasil(baris, kolom) = 0;
        elseif Hasil(baris, kolom) >= f2
            Hasil(baris, kolom) = 255;
        end
    end
end
end

figure(8);
 % Aktifkan figure 8
H = potong('emon.jpg', 30, 170);
imshow(H);
title('Pemotongan Aras Keabuan');

%8. Ekualisasi histogram%
Img = imread('emon.jpg');
Img = rgb2gray(Img);  % Ubah ke grayscale

[jum_baris, jum_kolom] = size(Img);
L = 256;
Histog = zeros(L, 1);

% Hitung histogram
for baris = 1 : jum_baris
    for kolom = 1 : jum_kolom
        nilai = Img(baris, kolom);
        Histog(nilai + 1) = Histog(nilai + 1) + 1;
    end
end

% Hitung transformasi kumulatif (CDF)
alpha = (L - 1) / (jum_baris * jum_kolom);
C(1) = alpha * Histog(1);
for i = 2 : L
    C(i) = C(i - 1) + round(alpha * Histog(i));
end

% Terapkan transformasi ke gambar
Hasil = Img;
 % Inisialisasi
for baris = 1 : jum_baris
    for kolom = 1 : jum_kolom
        Hasil(baris, kolom) = C(Img(baris, kolom) + 1);
    end
end

Hasil = uint8(Hasil);
% Konversi ke uint8 agar bisa ditampilkan

% Tampilkan hasil di figure 9
figure(9); clf;

subplot(1,2,1);
imshow(Img);
title('Gambar Asli (Grayscale)');

subplot(1,2,2);
imshow(Hasil);
title('Hasil Ekualisasi Histogram');
