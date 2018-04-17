%首先初始化各个坐标，坐标由CAD画图可得%
p0=[1000 ,3000],p1=[3000 ,3800],p2=[3200 ,3800],p3=[3950 ,4300],p4=[4950 ,4300]
o0=[2815.9013,5194.1045],g0=[5553.3234,3000],w0=[2325,3530],w1=[4450,3700]
ai=[0.35,1.9]
%再初始化各个物理要素
%phi为重度，fai为内摩擦角，ccet为粘聚力
phi=[0.01813,0.01082]
fai=[deg2rad(26),deg2rad(22),deg2rad(24)]
ccet=[1.47,0.784,1.127]
%%
%几何要素求解函数：
%     其中finalo为不同的圆心坐标向量
%         ph为相应的圆心角向量
%         hro、zoom是条分法中各个分条的上沿坐标
%%
[finalo,ph,hro,zoom,leng,polym,x4,po2,po1,po4]=circlepoint(p0,p1,p2,p3,p4,o0,g0,w0,w1)
%for i=1:100
    %radius(i)=sqrt((finalo(1,i)-p0(1))^2+(finalo(2,i)-p0(2))^2)
   % midx=[hro,x4(1,1:i)]
  %  for j=1:leng
  %  crilclezoom(j)=-(sqrt(radius(i)^2-(midx(j)-finalo(1,i))^2))+finalo(2,i)
  %  end
%end
%%
%求解分条下边的圆弧横坐标坐标
%其中cricley是纵坐标，radius是各个情况下的滑动面半径
[cricley,radius]=criclezoom(finalo,hro,x4,p0,leng)
%%
%求解浸水面分界点的坐标
%upturn为上沿转折点，
%lowturn为下沿，在这里需要注意的是上沿只有一个转折，但是下沿的转折点在不同的半径会发生变化。
for i=1:100
    gnshield=find(cricley(i,:)>(po4(1).*polym(1)+po4(2)),1)
    lowturn(i)=gnshield
end
upturn=find(zoom>3530,1)
%%
%求解土地分块的重度的函数（分干湿状态）
[Qgra,Dgra]=lowinter(radius,finalo,polym,po1,po2,po4,upturn,phi,lowturn)
%%
%求解各个分块的角度
theta=aerfa(cricley,polym)
%%
%接下来是分块单元的受力求解
[frictionforce,adhsive,tforce,waforce]=caclufor(Qgra,Dgra,theta,upturn,...
    lowturn,cricley,polym,radius,fai,ccet)
%%
%累加和求解滑动系数
[Ks]=kcaclu(frictionforce,adhsive,tforce,waforce,ai)