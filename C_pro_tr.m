function pr_tr=C_pro_tr(Y,X)   %--经典投影---计算两个矩阵之间的投影%
% X2=sum(sum(X.^2));
% X=x_v(X);
% Y=x_v(Y);
XY=sum(sum(X.*Y));
Y2=sum(sum(Y.^2));

if Y2==0
    pr_tr=1;
else 
pr_tr=(XY)/(Y2^0.5);
end
end