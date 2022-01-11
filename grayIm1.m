%% Centroid

function [nk,k,Cs,n,fk,im1,f1]=grayIm1(nk,k,Cs,n,fk,im1)
    [row,col]=size(im1);
    f1=zeros(row,col); 
    for z=1:nk
        fprintf('   %i\t  %i\t', k(z),fk(z)) 
        n(z) = k(z);
    end
    fprintf('\n')
    for i=1:row 
        for j=1:col
            min = abs(k(1)-im1(i,j)); index=1;
            for z = 2:nk                
                x(z)= abs(k(z)-im1(i,j));
                if (x(z) <= min)
                    min = x(z); index=z;
                end
            end
            Cs(index).C(i,j) = im1(i,j);
        end
    end
  for z=1:nk
    k(z)=int16(sum(Cs(z).C(:)) / nnz(Cs(z).C(:)));
    if (isequal(n(z),k(z))==1)
        fk(z) = 1;
    end
  end       
  flag1=0;
  if(sum(fk)==nk)
       flag1=1;
  end
  if (flag1==0)                  
      grayIm1(nk,k,Cs,n,fk,im1);
  else
      [f1,nk,k,Cs,im1]=disp1(f1,nk,k,Cs,im1);
      [psnr]=PSNR(im1,f1);
      fprintf('psnr = %f',psnr);
      fprintf('\n');
      %pnsr(f1,im1);3
  end
end