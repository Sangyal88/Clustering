function [f1,A1] = disp1(k,c,A1)
    [row,col]=size(A1);
    f1=zeros(row,col);
%     for z=1:nk
%       figure,imshow(uint8(Cs(z).C));title(sprintf('Final C%d',z));
%     end
    for z = 1:k
        for i=1:row 
            for j=1:col               
                if((c(z).clus(i,j))~=0)
                    f1(i,j)=c(z).centroid;
                end              
            end
        end
    end
    figure,imshow(uint8(f1));title('Final Image')
end


