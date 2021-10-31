%% 
function [sse1,im1]=SSE(nk,c,cen,im1)
    [row,col]=size(im1); 
    %sse1=double(sse1);
     sse1=0;
     %sse1= double(se);
     sse1=int32(sse1);
    % se=0;
    %sse = zeros(1, nk);
    fprintf('Value of nk is  %i',nk);
    fprintf('\n');
    for z=1:nk
        
       for i=1:row
            for j=1:col
                if(c(z).clus(i,j)~=0)
%                     sse(z)=sse(z)+(k(z)-Cs(z).C(i,j))^2;
                    %sse(z)=sse(z)+(c(z).centroid-c(z).clus(i,j))^2;
                    %fprintf('Value to  SSE = %i+(%i - %i)',sse1,c(z).centroid,c(z).clus(i,j));
                    %fprintf('\n');
                    sse1=sse1+(cen(z) - c(z).clus(i,j))^2;
                    %sse=se;
                end
            end
        end 
    end
    fprintf('SSE value %i',sse1);
    fprintf('\n');
end
