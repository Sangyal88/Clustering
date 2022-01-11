% % Display

function [f1,nk,k,Cs,im1] = disp1(f1,nk,k,Cs,im1)
    [row,col]=size(im1);
    for z=1:nk
%       figure,imshow(uint8(Cs(z).C));title(sprintf('Unsupervised Final C%d',z));
    end
    for i=1:row 
        for j=1:col
            for z = 2:nk                
                if((Cs(z).C(i,j))~=0)
                    f1(i,j)=k(z);
                end              
            end
        end
    end
    figure,imshow(uint8(f1));
    title(sprintf('Unsupervised Final using %d clusters',nk));
end