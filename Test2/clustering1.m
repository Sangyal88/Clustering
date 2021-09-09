im = imread('Images/fruitssmall.png');
% im = imread('Images/baboon.png');
% im = imread('Images/fruits.png');
% im = imread('Images/FrozenFranzJoshef.jpg');
% im = imread('Images/lena.png');
% im = imread('Images/airplane.png');
% im = imread('Images/boat.png');
% im = imread('Images/zelda.png');
% im = imread('Images/fingerprint1.tif');
% im = imread('Images/fingerprint2.tif');
% im = imread('Images/cameraman.tif');
% im = imread('Images/mountain.png');
% im = imread('Images/hunter.tif');
% figure,imshow(im)
% title('Colorscale Image')
% figure,imshow(im)
% title('Colorscale Image')

%% Grayscale Image
% im1=rgb2gray(im);
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end
% figure,imshow(im1);
% title('Grayscale Image');
% [freq, pix]=imhist(im1);
% imhist(im1),figure
% plot(im1),figure
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
tic
[ c1,c2,A1 ] = cluster( Ck,A1,c1,c2,t,countelement );
%for i=1 : row
    %for j= 1: col
        %val = A1(i, j);
        %if (val ~= Ck)
            %[index_i, index_j] = pointdistance(A1, i, j, Ck);
            %c1(i, j) = A1(i, j);
            %c1(index_i, index_j) = A1(index_i, index_j);
            
            %A1(index_i,index_j)=Ck;
            %A1(i,j)=Ck;
            %countelement = countelement + 2;
            %if (countelement >= t) 
                %break;
            %end
        %end
    %end
    %if (countelement >= t) 
        %break; %outer loop
    %end
%end

%for i=1 : row
    %for j= 1: col
        %if (A1(i,j) ~= Ck) && (countelement >= t)             
            %c2(i,j)=A1(i,j);
            %A1(i,j)=Ck;
        %end
    %end
%end
r = int16(0+255* rand(1,k)); %random between 0 and 255

%[mindistvalue, index_i, index_j]= pointdistance(A, 1, 2, Ck);
%fprintf('\n');
%fprintf('MinDistance=%i', mindistvalue);
%fprintf('\n');
%fprintf('index_i=%i, index_j=%i',ind_i,ind_j);
%fprintf('\n');
%fprintf('Val=%i',mid(1,2));
%fprintf('\n');
%im1=int16(im1);
%A=double(im1);
%distances1 = pdist2(A(:, 1:2), A(:, 1:2));
%distances = pdist(A);
%minDistance = min(distances(:));
%[rowOfA, rowOfB] = find(distances == minDistance);
%[rowOfA] = find(distances == minDistance);
%distances = pdist2(im1, im1);
fprintf('Finish');
fprintf('\n');
toc