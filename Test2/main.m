im = imread('Images/fruitssmall.png');
%im = imread('Images/boat.png');
if (size(im,3) ~= 1)    % for color image size(im,3)==3
    im1 = rgb2gray(im);   %converting to grayscale
elseif (size(im,3) == 1)
    im1 = im;
end
Ck = 999;
A=int16(im1); %A=double(im1);
A1=A; %keep a copy of A
n1 = numel(A); %total elements in A
countelement=0;
%nk=input('Enter the number of cluster : ');
%t = 0.5*(n1/nk); %75 percent
fprintf('\n')
[row,col]=size(im1);
%temperory matrix
%for z=1:nk
    %r(z)=0;
    %n(z)=0;
    %fk(z)=0;
    %n(z)=int16(n(z)); 
    %fk(z)=int16(fk(z));
    %Cs(z).c = zeros(row,col); 
    %Cs(z).centroid =0; 
    %fprintf('   k%d     c%d    ',z,z)
%end
%r = int16(0+255* rand(1,nk)); %random between 0 and 255
%for z=1:nk
    %min=r(z);f=0;
    %for p=z+1:nk
        %if(r(p)<min)
            %min=r(p);
            %index=p; f=1;
        %end
    %end
    %if(f==1)
        %min=r(index);
        %r(index)=r(z);
        %r(z)=min;                   
    %end
%end
%k=r; %%Now k(z) will have random initial centroid values
%for z=1:nk         
    %n(z)=int16(n(z)); 
    %Cs(z).C =int16(Cs(z).C);
    %fprintf('   k%d     c%d',z,z)
    %fprintf('   Centroid%d        ',z)
%end
%im1=int16(im1);
fprintf('\n')
tic
%[ c1,c2 ] = cluster( Ck,A1,c1,c2,t,countelement );
%grayIm1(nk,k,Cs,n,fk,A1);
%[ Cs, A1 ] = cluster2( Ck,nk,A1,Cs,t);
%[ nk,Cs,n,fk,A ] = centroid( nk,Cs,n,fk,A );
[ temp, h, l ] = pointdistance(A1);

[ c, temp1 ] = cluster_2( l, h, temp, A1);

toc
