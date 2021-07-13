 im = imread('benchmarks/fruits.png');
 if (size(im,3) ~= 1)    % for color image size(im,3)==3
     im1 = rgb2gray(im);   %converting to grayscale
 elseif (size(im,3) == 1)
     im1 = im;
 end

%im1=rand(5,5)

Ck = 999;
[row,col]=size(im1);
A=int16(im1);
%A=double(im1);
m=zeros(row,col);
min=double(m);
[mindist, mindistvalue, index_i, index_j, mid]= pointdistance(A, 1, 2, Ck);
fprintf('\n');
fprintf('MinVal=%i', mindistvalue);
A=double(im1);
fprintf('index_i=%i, index_j=%i',index_i,index_j);
fprintf('\n');
fprintf('Minimum Distance Matrix:');
