function I=Group_conversion_ind(X)
n=4;   %------�����ĸ���
k=3;   %------ר�ҵĸ���
[nn m]=size(X);
for i=1:k
    for j=1:n
    I(j+n*(i-1),:)=X(i+k*(j-1),:);
    end
end
