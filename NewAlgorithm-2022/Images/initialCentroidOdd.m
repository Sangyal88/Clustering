%% 
function [nk,im1,im2,im3,temp,k,Cs]=initialCentroidOdd(nk,im1,im2,im3,temp,k,Cs)
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
   k(1)=int16(sum(im2(:))/nnz(im2(:))); 
   k(3)=int16(sum(im3(:))/nnz(im3(:)));
   k(2)=temp;
   if(3<nk)
    for i=1:row 
            for j=1:col         
                if(k(1)<=im1(i,j))
                    for z=2:(nk-1)
                        if (k(z)<=im1(i,j)) 
                            index=z;
                        else
                            index=z;
                            break;
                        end
                    end                
                else
                    index=1;
                end            
                Cs(index).C(i,j) = im1(i,j);
            end
    end
   for z=1:nk
       f(z)=0;
       k(z)=int16(sum(Cs(z).C(:)) / nnz(Cs(z).C(:)));
   end
   t1=nnz(Cs(1).C(:));index=1;
   for z=2:(nk-1)
       t2=nnz(Cs(z).C(:));
       if(t2>t1)
           t1=t2;
           index=z;
           if(z==(nk-1))
                for i=1:row 
                    for j=1:col
                        if(Cs(index).C(i,j)>k(index))
                            Cs(nk).C(i,j)=Cs(index).C(i,j);                      
                        end
                    end
                end
            f(index)=1;
           end
       else
           if(z==(nk-1))
            for i=1:row 
                for j=1:col
                    if(Cs(index).C(i,j)>k(index))
                        Cs(nk).C(i,j)=Cs(index).C(i,j);                      
                    end
                end
            end
           end
            f(index)=1;
       end
   end
   for z=1:(nk-1)
       if(f(z)==1)
          Cs(z).C=imsubtract(Cs(z).C(:),Cs(nk).C(:)); 
       end
   end
   for z=1:nk
       k(z)=int16(sum(Cs(z).C(:)) / nnz(Cs(z).C(:)));
   end
   end
end
