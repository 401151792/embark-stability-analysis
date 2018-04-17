function[frictionforce,adhsive,tforce,waforce]=caclufor(Qgra,Dgra,theta,upturn,...
    lowturn,cricley,polym,radius,fai,ccet)
sigaforce1=Qgra.*cos(theta)
sigaforce2=Dgra.*cos(theta)
aa=Qgra
bb=Dgra
frictionforce=sigaforce1.*tan(fai(1))+sigaforce2.*tan(fai(2))
%for i=1:100
    %frico(i,1:upturn)=fai(2)
    %frico(i,upturn+1:lowturn(i))=fai(3)
    %frico(i,lowturn(i)+1:125)=fai(1)
%end
%fricoe=tan(frico)
%frictionforce=sigaforce.*fricoe
arcley=diff(cricley,1,2)
arclex1=diff(polym(1,:))
for i=1:100
    arclex(i,:)=arclex1
end
arcley(arcley==0)=nan
arcle=sqrt(arclex.^2+arcley.^2)
arcle(arcle>2000)=nan
%for i=1:100
    %adh(1,1:upturn)=ccet(2)
   % adh(1,upturn+1:lowturn(i))=ccet(3)
    %adh(1,lowturn(i)+1:125)=ccet(1)
%end
adhsive=arcle.*(aa./(aa+bb).*ccet(1)+(bb./(aa+bb).*ccet(2)))
tforce=(sigaforce2+sigaforce1).*sin(theta)
waforce=Dgra.*arcle./radius'