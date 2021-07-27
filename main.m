 im = imread('benchmarks/fruitssmall.png');
 if (size(im,3) ~= 1)    % for color image size(im,3)==3
     im1 = rgb2gray(im);   %converting to grayscale
 elseif (size(im,3) == 1)
     im1 = im;
 end

%im1=rand(5,5)
Ck = 999;
[row,col]=size(im1);
A=int16(im1); %A=double(im1);
A1=A; %keep a copy of A

k=2; %No. of Clusters
c1= zeros(row,col); %cluster 1
c2= zeros(row,col); %cluster 2
c1=int16(c1);
c2=int16(c2);
n = numel(A); %total elements in A
t = 0.5*(n/k); %75 percent
countelement=0;
[ c1,c2, A1 ] = cluster( Ck,A1,c1,c2,t,countelement );
r = int16(0+255* rand(1,k)); % two random numbers between 0 and 255
%c3 = uint8(c1);
%c4 = uint8(c2);
