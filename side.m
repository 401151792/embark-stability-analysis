%���ȳ�ʼ���������꣬������CAD��ͼ�ɵ�%
p0=[1000 ,3000],p1=[3000 ,3800],p2=[3200 ,3800],p3=[3950 ,4300],p4=[4950 ,4300]
o0=[2815.9013,5194.1045],g0=[5553.3234,3000],w0=[2325,3530],w1=[4450,3700]
ai=[0.35,1.9]
%�ٳ�ʼ����������Ҫ��
%phiΪ�ضȣ�faiΪ��Ħ���ǣ�ccetΪճ����
phi=[0.01813,0.01082]
fai=[deg2rad(26),deg2rad(22),deg2rad(24)]
ccet=[1.47,0.784,1.127]
%%
%����Ҫ����⺯����
%     ����finaloΪ��ͬ��Բ����������
%         phΪ��Ӧ��Բ�Ľ�����
%         hro��zoom�����ַ��и�����������������
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
%�������±ߵ�Բ������������
%����cricley�������꣬radius�Ǹ�������µĻ�����뾶
[cricley,radius]=criclezoom(finalo,hro,x4,p0,leng)
%%
%����ˮ��ֽ�������
%upturnΪ����ת�۵㣬
%lowturnΪ���أ���������Ҫע���������ֻ��һ��ת�ۣ��������ص�ת�۵��ڲ�ͬ�İ뾶�ᷢ���仯��
for i=1:100
    gnshield=find(cricley(i,:)>(po4(1).*polym(1)+po4(2)),1)
    lowturn(i)=gnshield
end
upturn=find(zoom>3530,1)
%%
%������طֿ���ضȵĺ������ָ�ʪ״̬��
[Qgra,Dgra]=lowinter(radius,finalo,polym,po1,po2,po4,upturn,phi,lowturn)
%%
%�������ֿ�ĽǶ�
theta=aerfa(cricley,polym)
%%
%�������Ƿֿ鵥Ԫ���������
[frictionforce,adhsive,tforce,waforce]=caclufor(Qgra,Dgra,theta,upturn,...
    lowturn,cricley,polym,radius,fai,ccet)
%%
%�ۼӺ���⻬��ϵ��
[Ks]=kcaclu(frictionforce,adhsive,tforce,waforce,ai)