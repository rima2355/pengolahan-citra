% FILBATAS Melakukan operasi ketetanggan piksel
% menggunakan filter batas
F = imread('orang.jpg');
Ukuran = size(F);
tinggi = Ukuran(1);
lebar = Ukuran(2);
G = F;

76 Pengolahan Citra, Teori dan Aplikasi

for baris=2 : tinggi-1
for kolom=2 : lebar-1
minPiksel = min([F(baris-1, kolom-1) ...
F(baris-1, kolom) F(baris, kolom+1) ...
F(baris, kolom-1) ...
F(baris, kolom+1) F(baris+1, kolom-1) ...
F(baris+1, kolom) F(baris+1, kolom+1)]);
maksPiksel = min([F(baris-1, kolom-1) ...
F(baris-1, kolom) F(baris, kolom+1) ...
F(baris, kolom-1) ...
F(baris, kolom+1) F(baris+1, kolom-1) ...
F(baris+1, kolom) F(baris+1, kolom+1)]);
if F(baris, kolom) < minPiksel
G(baris, kolom) = minPiksel;
else
if F(baris, kolom) > maksPiksel
G(baris, kolom) = maksPiksel;
else
G(baris, kolom) = F(baris, kolom);
end
end
end
end
figure(1);
imshow(G);
clear;
