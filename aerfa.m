%%
%theta为各个分块的法向角度
function[theta]=aerfa(cricley,polym)
bb=diff(cricley,1,2)
cc=diff(polym,1,2)
theta=bb./(cc(1,:))
a=isnan(theta)
b=theta
b(a)=0
theta=b