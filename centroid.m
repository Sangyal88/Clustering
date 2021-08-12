function [ nk,k,Cs,n,fk,A1 ] = centroid( nk,k,Cs,n,fk,A1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   [row,col]=size(A1);f1=zeros(row,col);
    for z=1:nk
        fprintf('  %i\t   %i\t  ',Cs(z).centroid, fk(z))  
        n(z) = k(z);
    end
    fprintf('\n')
 for z=1:nk
    for i=1:row      
        for j=1:col  
            min = abs(k(z)-A1(i,j));r=0;
            for p=1:nk                  
               max = abs(k(p)-A1(i,j));
               if(min <= max && p~=z && z>p)
                    r=1; 
               elseif(min < max && p~=z && z<p)
                    r=1;
               else
                    if(p==z)
                        continue;
                    else
                        r=0;
                        break;
                    end
                end
             end
             if(r==1)
                Cs(z).C(i,j) = A1(i,j);   
             end
        end
    end 
 end
    for z=1:nk
        k(z)=int16(sum(Cs(z).C(:)) / nnz(Cs(z).C(:)));
        if(isequal(n(z),k(z))==1)
            fk(z)=1;
        else
            fk(z)=0;
        end
    end  
    flag1=0;
    if(sum(fk)==nk)
       flag1=1;
    end
    if (flag1==0)                  
        [nk,k,Cs,n,fk,A1]=centroid(nk,k,Cs,n,fk,A1);
        %gray1(nk,k,Cs,n,fk,A1);
    else
        [f1,nk,k,Cs,A1]=disp1(f1,nk,k,Cs,A1);
        pnsr(f1,A1);
    end
end



