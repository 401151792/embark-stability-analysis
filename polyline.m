function[polym]=polyline(x,po1,po2)
for i=1:length(x)
if(x(i)<3000)
    y(i)=po1(1)*x(i)+po1(2)
else if(x(i)>=3000&x(i)<3200)
    y(i)=3800
    else if((x(i)>=3200&x(i)<3950))
            y(i)=po2(1)*x(i)+po2(2)
        else if (x(i)>=3950&x(i)<=4950)
                y(i)=4300
            end
        end
    end
end
end
polym(1,:)=x
polym(2,:)=y
                
