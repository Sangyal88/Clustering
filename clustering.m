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

k=2;%No. of Clusters
c1=zeros(row,col);%cluster 1
c2=zeros(row,col);%cluster 2
c1=int16(c1);
c2=int16(c2);
n=numel(A);%total elements in A
t=0.75*(n/k);%75 percent
[c1,c2] = Pdistance2(X, c1, c2, k, Ck, ind_i, ind_j, t, min );

[mindist, mindistvalue, index_i, index_j, mid]= pointdistance(A, 1, 2, Ck);
fprintf('\n');
fprintf('MinVal=%i', mindistvalue);
A=double(im1);
fprintf('index_i=%i, index_j=%i',index_i,index_j);
fprintf('\n');
fprintf('Minimum Distance Matrix:');
