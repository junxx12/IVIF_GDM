function I=ind_conversion_Group(X)
n=5;   %------�����ĸ���
k=5;   %------ר�ҵĸ���
[nn m]=size(X);

for j=1:n
    for i=1:k
    I(i+k*(j-1),:)=X(j+n*(i-1),:);
    end
end
