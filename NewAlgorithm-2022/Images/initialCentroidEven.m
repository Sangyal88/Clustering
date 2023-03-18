%% 
function [nk,im1,im2,im3,temp,k,Cs]=initialCentroidEven(nk,im1,im2,im3,temp,k,Cs)
    [row,col]=size(im1);
    for i=1:row 
        for j=1:col
            if(im1(i,j) <= temp)
                im2(i,j)= im1(i,j);   
            else
                im3(i,j)= im1(i,j);
            end
        end
    end 
   if(2<nk)
        k(1)=int16(sum(im2(:))/nnz(im2(:))); 
        k(3)=int16(sum(im3(:))/nnz(im3(:)));
        k(2)=temp;
        for i=1:row 
            for j=1:col         
                if(im1(i,j)<k(1))
                    index=1;               
                else
                    for z=2:nk
                        if (im1(i,j)<k(z)) 
                            index=z;
                            break;
                        else
                            index=z;
                        end
                    end 
                end            
                Cs(index).C(i,j) = im1(i,j);
            end
        end
        for z=1:nk
            k(z)=int16(sum(Cs(z).C(:)) / nnz(Cs(z).C(:)));
        end
   else
        k(1)=int16(sum(im2(:))/nnz(im2(:))); 
        k(2)=int16(sum(im3(:))/nnz(im3(:)));
   end
end
