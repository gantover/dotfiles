# row to column or vice versa
v3'

# plotting a 3D vector

v3 = [ 1 4 3 ]
subplot(212)
plot3([0 v3(1)],[0 v3(2)],[0 v3(3)], 2)
axis square
axis([ -4 4 -4 4 -4 4 ])
hold on, grid on
plot3(get(gca,'xlim'),[0 0],[0 0],'k--')
plot3([0 0],get(gca,'ylim'),[0 0],'k--')
plot3([0 0],[0 0],get(gca,'zlim'),'k--')
xlabel('X_1 dimension')
ylabel('X_2 dimension')
zlabel('X_3 dimension')

# get a better view at what the vector looks like in space
rotate3d on

# addition and subtraction
v1 = [ 3 -1 ];
v2 = [ 2 4 ];

v3 = v1+v2;

plot([0 v1(1)], [0 v1(2)],'b','linew',2)
hold on
plot([0 v2(1)], [0 v2(2)],'r','linew',2)
plot([0 v3(1)], [0 v3(2)],'k','linew',2)
legend({'v1';'v2';'v1+v2'})

axis square
axis([ -2 2 -2 2 ]*3)
hold on
plot(get(gca,'xlim'),[0,0],'k--')
plot([0,0],get(gca,'ylim'),'k--')

