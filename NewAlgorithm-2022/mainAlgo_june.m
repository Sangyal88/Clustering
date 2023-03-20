clear
%im = imread('Images/lenaColor.png');
%im = imread('Images/fruits.png');
%im = imread('Images/boat.png');
%im = imread('Images/peppers.png');
%im = imread('Images/hunter.tif');
im = imread('Images/baboon.png');
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end

image=im1;
Ma=max(im1);
M=max(Ma);
[row, col]=size(im1);

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
    ind(i).pixel_val = 0;
        
end
for j=1:10 
    t(j)=0;
end
c = input('Enter number of clusters : ');
tic
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
        ind(diffval+1).pixel_val= pixelIndex.value;      
    end
end
count = 0;
%--------------------For counting the number of non zero total pixels------------%
tl=0; 
for t=1:256
    if (ind(t).totalPixels>0)
        tl=tl+1;
    end
end
cl_size=int16(tl/c);

%---------------------------------------------------------------------------------%
maxi=0;%Keeps the maximum pixel count for each radius group
ci=1;
r_temp= cl_size;
c=0;
%------------Capurting the maximum pixel count value and the associated
%pixel value for the radius group---------------%
tic
for i=1:256 
    if (r_temp-i>=0)%checking the entered cluster size
         count=count+1;%count increment
        if (ind(i).totalPixels>0 && ind(i).totalPixels>maxi)
           
               maxi=ind(i).totalPixels;%maximum total pixel count
               t(ci)=ind(i).pixelValues.value;%pixel value of the highest pixel count
               rec = r_temp-i; %records the position of the highest frequency pixel in the cluster
               c=count;
                      
        end
        if (rec== cl_size-1 && c== cl_size)
            
                
                r_temp=r_temp-5; %Decrease the size of the current cluster by 5 if the highest frequency pixel is in the initial position of the cluster
              
            
        elseif (rec==0 && c==cl_size)
            
               
                r_temp=r_temp+5; %Inecrease the size of the current cluster by 5 if the highest frequency pixel is in the last position of the cluster
                
            
        end

    else %if the cluster size exceeds
        r_temp=r_temp+cl_size;
        rec = 0;
        count=1;
        ci = ci+1;
        maxi=0;
        if (ind(i).totalPixels>0 && ind(i).totalPixels>maxi)
            
                maxi=ind(i).totalPixels;%maximum total pixel count
                t(ci)=ind(i).pixelValues.value;%pixel value of the highest pixel count
                if(count==1)%Checking if the maximum pixel count is the initial
                   r_temp=r_temp-5;
                end
              
        end
    end
end
toc
%[tax] = arrange(r,ind,row,col);
%-------------------replacing the radius pixel values with the pixel values
%of the highest pixel count pixel value-------------------%
tax = zeros(row, col);
%x=numel(t);
r_temp=cl_size;
z=1;
for q=1:256 
    if (r_temp-q>=0)
        if (ind(q).totalPixels>0)
           for k=1:ind(q).totalPixels
                x= ind(q).pixelValues(k).r;
                y= ind(q).pixelValues(k).c;
                tax(x,y)= t(z);%placing the pixel value in the new image matrix 
                
           end       
        end
    else
        r_temp=r_temp+cl_size;
        z = z+1;
        if (ind(q).totalPixels>0)
            for k=1:ind(q).totalPixels
                x= ind(q).pixelValues(k).r;
                y= ind(q).pixelValues(k).c;
                tax(x,y)= t(z);
           end    
        end
    end
   
end

figure,imshow(uint8(tax));title('Final Image')
[psnr]= psnr1(tax, image);
fprintf('psnr value= %f',psnr);
fprintf('\n');
