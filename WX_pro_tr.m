function pr_tr=WX_pro_tr(Y,X)   %--����[]��һ��ͶӰ---������������֮���ͶӰ%
% X=x_v(X);
% Y=x_v(Y);
X2=sum(sum(X.^2));
XY=sum(sum(X.*Y));
Y2=sum(sum(Y.^2));
pr_tr=(1+X2)/(1+X2+abs(XY-Y2));
end