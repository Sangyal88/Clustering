%% Image Reading

%im = imread('Images/peppers.png');
% im = imread('Images/baboon.png');
 im = imread('Images/fruits.png');
%im = imread('Images/lena.png');
%im = imread('Images/baboon.png');
%im = imread('Images/person1001_bacteria_2932.jpeg');
% im = imread('Images/lena.png');
% im1 = imread('Images/cameraman.tif');
% figure,imshow(im)
% title('Colorscale Image')

%% Grayscale Image
im1=rgb2gray(im);
% figure,imshow(im1);
% title('Grayscale Image');
% [freq, pix]=imhist(im1);
% imhist(im1),figure
% plot(im1),figure

%% 
% tic
nk=input('Enter the number of cluster : ');
fprintf('\n')
[row,col]=size(im1);
for z=1:nk
    r(z)=0;
    k(z)=0;
    n(z)=0;
    fk(z)=0;
    Cs(z).C =zeros(row,col);    
end
r = int16(0+255* rand(1,nk)); %random between 0 and 255
for z=1:nk
    min=r(z);f=0;
    for p=z+1:nk
        if(r(p)<min)
            min=r(p);
            index=p; f=1;
        end
    end
    if(f==1)
        min=r(index);
        r(index)=r(z);
        r(z)=min;                   
    end
end
k=r; %%Now k(z) will have random initial centroid values
for z=1:nk         
    n(z)=int16(n(z)); 
    Cs(z).C =int16(Cs(z).C);
    fprintf('   k%d     c%d',z,z)
end
im1=int16(im1);
fprintf('\n')
tic
[nk,k,Cs,n,fk,im1,f1]=grayIm1(nk,k,Cs,n,fk,im1);
toc
%[psnr]= PSNR(im1,f1);
%fprintf('PSNR = %f',psnr);
% toc

