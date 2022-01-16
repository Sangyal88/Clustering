 im = imread('Images/fruits.png');
%im = imread('Images/fruitssmall.png');

%im = imread('Images/boat.png');
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end
Ck = 999;
A=int16(im1); %A=double(im1);
A1=A; %keep a copy of A
se=0;


% tic
%[ c1,c2 ] = cluster( Ck,A1,c1,c2,t,countelement );
%grayIm1(nk,k,Cs,n,fk,A1);
%[ Cs, A1 ] = cluster2( Ck,nk,A1,Cs,t);
%[ nk,Cs,n,fk,A ] = centroid( nk,Cs,n,fk,A );
%[IDX,C,SUMD,Kb]=best_kmeans(A1);
m = input('Enter the number of cluster : ');
s=zeros(m-1,2);
% s=int32(s); 
a=1;

for i= 2:m
    tic
    [ temp, h, l ] = pointdistance(A1);
    [ c, temp1, cen ] = cluster_22(l, h, temp, A1, i); %%When the initial value of c.clus is 555
    toc
%plotScree(A1, nk, h, l, temp);
%[sse1,A1]=SSE(nk,c,A1);
%for i=2:m
    [sse1, im1]=SSE(i,c,cen,A1);
    s(i-1,1)= i;
    s(i-1,2)= sse1;
%     a=a+1;
end
hold on

x = s( :, 1);
y = s(:, 2);

%plot(s)
plot(x, y)
plot(x, y, 'g*')
xlabel('Number of clusters')
ylabel('Within-cluster sum-of-squares')
% toc
[f1,A1] = disp1(m,c,cen,A1);
