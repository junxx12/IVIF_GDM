function pr_tr=our_pro_tr(Y,X)   %--����[]��һ��ͶӰ---������������֮���ͶӰ%
X2=sum(sum(X.^2));
XY=sum(sum(X.*Y));
Y2=sum(sum(Y.^2));
pr_tr=(1+XY+min(X2,Y2))/(1+X2^0.5*Y2^0.5+max(X2,Y2));
end