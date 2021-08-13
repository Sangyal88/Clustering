function [f1,nk,Cs,A1] = disp1(f1,nk,Cs,A1)
    [row,col]=size(A1);
%     for z=1:nk
%       figure,imshow(uint8(Cs(z).C));title(sprintf('Final C%d',z));
%     end
    for z = 1:nk
        for i=1:row 
            for j=1:col               
                if((Cs(z).C(i,j))~=0)
                    f1(i,j)=Cs(z).centroid;
                end              
            end
        end
    end
    figure,imshow(uint8(f1));title('Final Image')
end


