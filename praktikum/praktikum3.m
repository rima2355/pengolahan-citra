pkg load image;
% Membaca lima gambar dengan jenis noise berbeda
F1 = imread('C:\Pengolahan Citra 4\praktek3\praktek3\anime.jpg');
F2 = imread('C:\Pengolahan Citra 4\praktek3\praktek3\gambar.jpg');
F3 = imread('C:\Pengolahan Citra 4\praktek3\praktek3\jujutsu.jpeg');
F4 = imread('C:\Pengolahan Citra 4\praktek3\praktek3\kartun.jpg');
F5 = imread('C:\Pengolahan Citra 4\praktek3\praktek3\satoru.jpg');

% Simpan gambar dalam cell array
gambar_asli = {F1, F2, F3, F4, F5};
nama_gambar = {
    'anime.jpg',
    'gambar.jpg',
    'jujutsu.jpeg',
    'kartun.jpg',
    'satoru.jpg'
};

%% FILTER BATAS
for i = 1:5
    img = gambar_asli{i};
    if ndims(img) == 3
        img = rgb2gray(img);
    end
    [tinggi, lebar] = size(img);
    G = img;
    for baris = 2:tinggi-1
        for kolom = 2:lebar-1
            neighbor = [img(baris-1, kolom-1), img(baris-1, kolom), img(baris-1, kolom+1), ...
                        img(baris, kolom-1), img(baris, kolom+1), ...
                        img(baris+1, kolom-1), img(baris+1, kolom), img(baris+1, kolom+1)];
            minPiksel = min(neighbor);
            maksPiksel = max(neighbor);
            if img(baris, kolom) < minPiksel
                G(baris, kolom) = minPiksel;
            elseif img(baris, kolom) > maksPiksel
                G(baris, kolom) = maksPiksel;
            end
        end
    end

    figure(i); % Figure 1–5
    subplot(2,2,1); imshow(img); title(['Sebelum - ' nama_gambar{i}]);
    subplot(2,2,2); imshow(G); title('Sesudah (Batas)');
    subplot(2,2,3); imhist(img); title('Histogram Sebelum');
    subplot(2,2,4); imhist(G); title('Histogram Sesudah');
end

%% FILTER PERERATAAN
for i = 1:5
    img = gambar_asli{i};
    if ndims(img) == 3
        img = rgb2gray(img);
    end
    [tinggi, lebar] = size(img);
    G = zeros(tinggi, lebar);
    img_double = double(img);
    for baris = 2:tinggi-1
        for kolom = 2:lebar-1
            blok = img_double(baris-1:baris+1, kolom-1:kolom+1);
            G(baris, kolom) = mean(blok(:));
        end
    end
    G = uint8(G);

    figure(i + 5); % Figure 6–10
    subplot(2,2,1); imshow(img); title(['Sebelum - ' nama_gambar{i}]);
    subplot(2,2,2); imshow(G); title('Sesudah (Perataan)');
    subplot(2,2,3); imhist(img); title('Histogram Sebelum');
    subplot(2,2,4); imhist(G); title('Histogram Sesudah');
end

%% FILTER MEDIAN
for i = 1:5
    img = gambar_asli{i};
    if ndims(img) == 3
        img = rgb2gray(img);
    end
    [tinggi, lebar] = size(img);
    G = img;

    for baris = 2:tinggi-1
        for kolom = 2:lebar-1
            blok = [
                img(baris-1, kolom-1), img(baris-1, kolom), img(baris-1, kolom+1), ...
                img(baris, kolom-1),   img(baris, kolom),   img(baris, kolom+1), ...
                img(baris+1, kolom-1), img(baris+1, kolom), img(baris+1, kolom+1)
            ];
            blok = sort(blok);
            G(baris, kolom) = blok(5);  % Median
        end
    end

    figure(i + 10); % Figure 11–15
    subplot(2,2,1); imshow(img); title(['Sebelum - ' nama_gambar{i}]);
    subplot(2,2,2); imshow(G); title('Sesudah (Median)');
    subplot(2,2,3); imhist(img); title('Histogram Sebelum');
    subplot(2,2,4); imhist(G); title('Histogram Sesudah');
end
