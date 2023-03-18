clear
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
M=max(Ma)
[row, col]=size(im1)

pixelIndex.r = 0;
pixelIndex.c = 0;

for i=1: 256
    ind(i).totalPixels = 0;
    ind(i).pixelValues = pixelIndex([]); % creating an empty structs with pixelIndex
end


for i=1:row
   for j=1:col
        val=image(i,j);
        diffval=abs(M-val);
       
        pixelIndex.r = i;
        pixelIndex.c = j;
        total_pixels = ind(diffval+1).totalPixels + 1;
        ind(diffval+1).totalPixels = total_pixels;
        ind(diffval+1).pixelValues(total_pixels) = pixelIndex;
        
    end
end

new = null(row,col);%code for trial
for i=1:256
    if (ind(i).totalPixels>0)
        for z=1:ind(i).totalPixels
            x= ind(i).pixelValues(z).r;
            y= ind(i).pixelValues(z).c;
            new(x,y)= i-1;
        end

    end
end
