view(3)
axis([-20,20,-30,30,0,50])
f=plot3(x(1),y(1),z(1));

for i=2:length(tout)
f=plot3(x(1:i),y(1:i),z(1:i));
grid
view(-37.5+i, 24)
end