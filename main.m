 im = imread('Images/fruitssmall.png');
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end
Ck = 999;
A=int16(im1); %A=double(im1);
A1=A; %keep a copy of A
n = numel(A); %total elements in A

nk=input('Enter the number of cluster : ');
t = 0.5*(n/nk); %75 percent
fprintf('\n')
[row,col]=size(im1);
for z=1:nk
    Cs(z).C =zeros(row,col);   
    Cs(z).centroid =0; 
    fprintf('   Centroid%d        ',z)
end
tic
%[ c1,c2 ] = cluster( Ck,A1,c1,c2,t,countelement );
%grayIm1(nk,k,Cs,n,fk,A1);
[ Cs, A1 ] = initial_centroid( Ck,nk,A1,Cs,t);
toc
