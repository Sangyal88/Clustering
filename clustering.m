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
c1= null(row,col);%cluster 1
c2= null(row,col);%cluster 2
c1=int16(c1);
c2=int16(c2);
n=numel(A);%total elements in A
t=0.75*(n/k);%75 percent
%[c1,c2] = Pdistance2(X, c1, c2, k, Ck, 1, 2, t, min );

for i=1 : row
    for j= 1: col
       [mindistvalue, index_i, index_j,mid]= pointdistance(A, i, j, Ck, min);
       if(nnz(c1)<=t)%nnz counts the number of non zero elements
            c1(i,j)=A(i,j);
            c1(index_i,index_j)=A(index_i,index_j);
            A(index_i,index_j)=Ck;
            A(i,j)=Ck;
       else
            c2(i,j)=A(i,j);
            c2(index_i,index_j)=A(index_i,index_j);
            A(index_i,index_j)=Ck;
            A(i,j)=Ck;
       end
    end
end    
%[mindist, mindistvalue, index_i, index_j, mid]= pointdistance(A, 1, 2, Ck);
%fprintf('\n');
%fprintf('MinVal=%i', mindistvalue);
%A=double(im1);
%fprintf('index_i=%i, index_j=%i',index_i,index_j);
%fprintf('\n');
%fprintf('Minimum Distance Matrix:');
