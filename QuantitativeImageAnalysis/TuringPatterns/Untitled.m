G = imread('samp1.png');
G = imrotate(G,90,'bilinear','crop');
G = imageTrim(G,2);
G = make32(G);
G2 = double(G(:,:,1));