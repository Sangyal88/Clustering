function [ Cs, A1 ] = cluster2( Ck,nk,A1,Cs,t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[row,col]=size(A1);
x=1;
countelement = 0;
   for i=1 : row
        for j= 1: col
            val = A1(i, j);            
                if (val ~= Ck)
                    [index_i, index_j] = pointdistance(A1, i, j, Ck);
                    Cs(x).c(i, j) = A1(i, j);
                    Cs(x).c(index_i, index_j) = A1(index_i, index_j);

                    A1(index_i,index_j)=Ck;
                    A1(i,j)=Ck;
                    countelement = countelement + 2;
                    %fprintf('The value of count=%i',countelement);
                    %fprintf('\n');
                    if (countelement >= t) 
                        countelement=0;
                        x = x + 1;
                        break;
                    end
                end
        end         
        if (countelement >= t && x == nk)
            break; %outer loop
        end
    end

for i=1 : row
    for j= 1: col
        if (A1(i,j) ~= Ck) && (countelement >= t)             
            Cs(nk).c(i,j)=A1(i,j);
            A1(i,j)=Ck;
        end
    end
end
%for n=1:nk
    %Cs(n).centroid = int16(sum(Cs(n).c(:))/nnz(Cs(n).c(:))); 
%end
   Cs(1).centroid=int16(sum(Cs(1).c(:))/nnz(Cs(1).c(:))); 
   %fprintf('try %i',k(1));
   Cs(2).centroid=int16(sum(Cs(2).c(:))/nnz(Cs(2).c(:)));
   %fprintf('\n')
   Cs(3).centroid=int16(sum(Cs(3).c(:))/nnz(Cs(3).c(:)));  
   %fprintf('try %i',k(3));
   fprintf('\n')
   if(3<nk)
        
        for z=1:nk
            Cs(z).centroid=int16(sum(Cs(z).c(:)) / nnz(Cs(z).c(:)));
            %fprintf('my print %i\t',k(z))
            %fprintf('\n')
        end
        if(4<nk)
            for p=5:nk
                t1=nnz(Cs(1).c(:));index=1;
                for z=2:(p-1)
                    t2=nnz(Cs(z).c(:));
                    if(t2>t1)
                        t1=t2;
                        index=z;
                        if(z==(p-1))
                            for i=1:row 
                                for j=1:col
                                    if(Cs(index).c(i,j) > Cs(index).centroid)
                                        Cs(p).c(i,j)=Cs(index).c(i,j);                      
                                    end
                                end
                            end  
                            Cs(index).c=imsubtract(Cs(index).c,Cs(p).c);
                        end
                    else
                        if(z==(p-1))
                            for i=1:row 
                                for j=1:col
                                    if(Cs(index).c(i,j)>Cs(index).centroid)
                                        Cs(p).c(i,j)=Cs(index).c(i,j);                      
                                    end
                                end
                            end   
                            Cs(index).c=imsubtract(Cs(index).c,Cs(p).c);
                        end
                    end
                end
                for z=1:nk
                    Cs(z).centroid=int16(sum(Cs(z).c(:)) / nnz(Cs(z).c(:)));
                end
            end
            for s=1:nk
                s1=Cs(s).centroid;
                f=0;
                for t=s+1:nk
                    if(Cs(t).centroid<s1)
                        s1=Cs(t).centroid;
                        index=t; f=1;
                    end
                end
                if(f==1)
                    s1=Cs(index).centroid;
                    Cs(index).centroid=Cs(s).centroid;
                    Cs(s).centroid=s1;                    
                end
            end
        end
   end            
   if(nk==2)
           Cs(1).centroid=int16(sum(Cs(1).c(:))/nnz(Cs(1).c(:))); 
           Cs(2).centroid=int16(sum(Cs(2).c(:))/nnz(Cs(2).c(:)));
   end

%for z=1:nk
        %fprintf('      %i\t        ',Cs(z).centroid)  
       % n(z) = k(z);
%end
fprintf('\n')
end

