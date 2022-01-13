function [f1,A1] = disp1(k,c,cen,A1)
    [row,col]=size(A1);
    f1=zeros(row,col);
%     for z=1:nk
%       figure,imshow(uint8(Cs(z).C));title(sprintf('Final C%d',z));
%     end
%for z = 1:k %Deepika's version
    for i=1:row 
        for j=1:col               
            for z = 1:k
                if((c(z).clus(i,j))~=0)
                    f1(i,j)=cen(z);
                    break;
                end              
            end
        end
    end
    figure,imshow(uint8(f1));title('Final Image')
end


