clear
%im = imread('Images/lenaColor.png');
%im = imread('Images/fruits.png');
%im = imread('Images/boat.png');
%im = imread('Images/peppers.png');
im = imread('Images/hunter.tif');
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end
%imshow(im1);
%ip=input('Enter the number of cluster : ');
%fprintf('\n');
image=im1;
Ma=max(im1);
M=max(Ma);
[row, col]=size(im1);
%for i= 1:100%start
   %Ai=null(row,col);
%end
pixelIndex.r = 0;
pixelIndex.c = 0;
pixelIndex.value = 0;
pix.x = 0;
pix.y = 0;
pix.val = 0;

for i=1: 256
    ind(i).diff_val = 0+(i-1);
    ind(i).totalPixels = 0;
    ind(i).pixelValues = pixelIndex([]); % creating an empty structs with pixelIndex
    c(i).cluster = ([]);
    cl(i).cont = zeros(10, 10);
    %cl(i).cont = zeros(row, col);
end


for i=1:row
   for j=1:col
        val=image(i,j);
        diffval=abs(M-val);
       
        pixelIndex.r = i;
        pixelIndex.c = j;
        pixelIndex.value = val;
        total_pixels = ind(diffval+1).totalPixels + 1;
        ind(diffval+1).totalPixels = total_pixels;
        ind(diffval+1).pixelValues(total_pixels) = pixelIndex;
            
    end
end
r = input('Enter the radius : ');%The difference grouping
count = 0;

ci=1;
r_temp=r;
for i=1:256  
    if (r_temp-i>=0)
        if (ind(i).totalPixels>0)
            c(ci).cluster= cl(ci);
            cl(ci).cont(i) = ind(i).pixelValues.value;
        end
    else
        r_temp=r_temp+r;
        ci = ci+1;
        if (ind(i).totalPixels>0)
            c(ci).cluster= cl(ci);
            cl(ci).cont(i) = ind(i).pixelValues.value;
        end
    end

end
