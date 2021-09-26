im = imread('fruitssmall.png');
%im = imread('Images/boat.png');
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end
Ck = 999;
A=int16(im1); %A=double(im1);
A1=A; %keep a copy of A
tic
%[ c1,c2 ] = cluster( Ck,A1,c1,c2,t,countelement );
%grayIm1(nk,k,Cs,n,fk,A1);
%[ Cs, A1 ] = cluster2( Ck,nk,A1,Cs,t);
%[ nk,Cs,n,fk,A ] = centroid( nk,Cs,n,fk,A );

nk = input('Enter the number of cluster : ');

[ temp, h, l ] = pointdistance(A1);

[ c, temp1 ] = cluster_2( l, h, temp, A1, nk);

toc
