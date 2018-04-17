%%
%lowint圆弧线面积积分
%uplint上方折线积分
%waterint积水线积分
function[Qgra,Dgra]=lowinter(radius,finalo,polym,po1,po2,po4,upturn,phi,lowturn)
for i=1:100
    for j=1:i+25
        lowint=@(X,R,X1,Y1) -sqrt(R^2-(X-X1).^2)+Y1-3000
        upint=@(x,k1,d1,k2,d2)((x<3000&x>=1000).*(k1.*x+d1)+...
            (x>=3000&x<3200).*(3800)+(x>=3200&x<3950).*(k2.*x+d2)+...
            (x>=3950&x<4950).*(4300))-3000
        waterint=@(x,k1,d1,k2,d2) ((x<2777.77777777778&x>1000).*(k1*x+d1)+...
            (x>=2777.77777777778).*(k2*x+d2)-3000)
        lowinte=integral(@(X)lowint(X,radius(i),finalo(1,i),finalo(2,i)),...
            polym(1,j),polym(1,j+1))
        upinte=integral(@(x)upint(x,po1(1),po1(2),po2(1),po2(2)),polym(1,j),polym(1,j+1))
        waterinte=integral(@(x)waterint(x,po1(1),po1(2),po4(1),po4(2)),polym(1,j),polym(1,j+1))
        Dgra(i,j)=(polym(1,j)<=polym(1,int8(lowturn(i)))).*(phi(2)*(waterinte-lowinte))+...
            (polym(1,j)<=polym(1,int8(lowturn(i)))).*0
        Qgra(i,j)=(polym(1,j)<=polym(1,int8(lowturn(i)))).*(phi(1)*(upinte-waterinte))+...
            (polym(1,j)>=polym(1,int8(lowturn(i)))).*(phi(1).*(upinte-lowinte))
    end
end