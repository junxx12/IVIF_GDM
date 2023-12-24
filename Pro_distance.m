function D_tr=Pro_distance(X,Y)
[n,m]=size(X);
g_m=m/4;
    for i=1:n
        for j=1:g_m
          D_tr(i,j)=our_pro_tr(X(i,1+(j-1)*4:4*j),Y(i,1+(j-1)*4:4*j));
        end
    end
end
