im = imread('Images/lenaColor.png');
%im = imread('Images/fruitssmall.png');

%im = imread('Images/boat.png');
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end
imshow(im1);
image=im1;
Ma=max(im1);
M=max(Ma);
[row, col]=size(im1);
T = zeros(256, 1);
 for i=1: 256
        ind(i).index = zeros(row,col);
        ind(i).index(:)= 555;
        ind(i).index = int32(ind(i).index);
 end
 
for i=1:row
   for j=1:col
        val=image(i,j);
        diffval=abs(M-val);
        ind(diffval+1).index(i,j)= image(i,j);
    end
end
  
