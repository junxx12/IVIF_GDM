function ww=w_Attribute_3(X)   %---适用用于决策矩阵给的是个体专家决策矩阵---%
[n m]=size(X);

nn=5;    %方案的个数
k=n/nn;%  专家的个数  
mm=m/4;  %属性的个数


 dk=X;
         for j=1:nn
            for jj=1:mm
             dk_A(j,1+4*(jj-1))=1-(1-dk(j,1+4*(jj-1)))^(1/3)*(dk(j+4,1+4*(jj-1)))^(1/3)*(dk(j+4*2,1+4*(jj-1)))^(1/3);
             dk_A(j,2+4*(jj-1))=1-(1-dk(j,2+4*(jj-1)))^(1/3)*(dk(j+4,2+4*(jj-1)))^(1/3)*(dk(j+4*2,2+4*(jj-1)))^(1/3);
             dk_A(j,3+4*(jj-1))=(dk(j,3+4*(jj-1)))^(1/3)*(dk(j+4,3+4*(jj-1)))^(1/3)*(dk(j+4*2,3+4*(jj-1)))^(1/3);
             dk_A(j,4+4*(jj-1))=(dk(j,4+4*(jj-1)))^(1/3)*(dk(j+4,4+4*(jj-1)))^(1/3)*(dk(j+4*2,4+4*(jj-1)))^(1/3);
            end
         end
w(1)=our_pro_tr(X(1:nn,:),dk_A);
w(2)=our_pro_tr(X(nn+1:2*nn,:),dk_A);
w(3)=our_pro_tr(X(2*nn+1:3*nn,:),dk_A);
w(4)=our_pro_tr(X(3*nn+1:4*nn,:),dk_A);
w(5)=our_pro_tr(X(4*nn+1:5*nn,:),dk_A);
w
ww=w/sum(w);
end
