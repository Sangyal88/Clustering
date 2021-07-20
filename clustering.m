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
for i=1 : row
    for j= 1: col
        val = A1(i, j);
        if (val ~= Ck)
            [index_i, index_j] = pointdistance(A1, i, j, Ck);
            c1(i, j) = A1(i, j);
            c1(index_i, index_j) = A1(index_i, index_j);
            
            A1(index_i,index_j)=Ck;
            A1(i,j)=Ck;
            countelement = countelement + 2;
            if (countelement >= t) 
                break;
            end
        end
    end
    if (countelement >= t) 
        break; %outer loop
    end
end

for i=1 : row
    for j= 1: col
        if (A1(i,j) ~= Ck) && (countelement >= t)             
            c2(i,j)=A1(i,j);
            A1(i,j)=Ck;
        end
    end
end

%c3 = uint8(c1);
%c4 = uint8(c2);
