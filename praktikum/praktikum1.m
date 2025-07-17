 img = imread('C:/rima/Pengolahan Citra 4/praktek3/praktek3/bunga.jpg');
 imshow(img);

ukuran = size (img);


 [baris,kolom,z] = size (img);


 gray = rgb2gray(img);
imshow(gray);

 bw = im2bw (gray);
imshow(bw);


 subplot(1,3,1), imshow(img);
 subplot(1,3,2), imshow(gray);
 subplot(1,3,3), imshow(bw);

 imwrite(img, 'bungargb.png');
imwrite(gray, 'bungagray.png');
 imwrite(bw, 'bungabw.png');

