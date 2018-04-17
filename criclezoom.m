function[cricley,radius]=criclezoom(finalo,hro,x4,p0,leng)
for i=1:100
    radius(i)=sqrt((finalo(1,i)-p0(1))^2+(finalo(2,i)-p0(2))^2)
    midx=[hro,x4(1,1:i)]
    n=length(midx)
    for j=1:126
        if j<=n
           cricley(i,j)=-(sqrt(radius(i)^2-(midx(j)-finalo(1,i))^2))+finalo(2,i)
        else cricley(i,j)=0
        end
    
    end
end