function [ nk,Cs,n,fk,A ] = centroid( nk,Cs,n,fk,A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
   [row,col]=size(A);
   f1=zeros(row,col);
    for z=1:nk
        fprintf('  %i\t   %i\t  ',Cs(z).centroid, fk(z))  
        n(z) = Cs(z).centroid;
    end
    fprintf('\n')
 for z=1:nk
    for i=1:row      
        for j=1:col  
            min = abs(Cs(z).centroid-A(i,j));r=0;
            for p=1:nk                  
               max = abs(Cs(p).centroid-A(i,j));
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
                Cs(z).C(i,j) = A(i,j);   
             end
        end
    end 
 end
    for z=1:nk
        Cs(z).centroid=int16(sum(Cs(z).C(:)) / nnz(Cs(z).C(:)));
        if(isequal(n(z),Cs(z).centroid)==1)
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
        [nk,Cs,n,fk,A]=centroid(nk,Cs,n,fk,A);
        %centroid(nk,Cs,n,fk,A);
        %gray1(nk,k,Cs,n,fk,A);
    else
        [nk,Cs,A]=disp1(f1,nk,Cs,A);
        %pnsr1(A, f1);
    end
end



