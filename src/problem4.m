
x_real=[0,0,210,210,0,0,148,148;
    0,0,0,0,0,105,0,105;
    0,120,0,120,0,0,0,0;
    1,1,1,1,1,1,1,1];
x_cam=[930,870,2762,2918,918,946,2302,2962;
    1483,95,1395,223,1479,2039,1387,1879;
    1,1,1,1,1,1,1,1];
[ABB,Hh]=homographyget(x_real,x_cam,8);
hhh=10000*Hh/6;
M=[];
M(1:3,1:3)=hhh(1:3,1:3);
[Q,R]=qr(inv(M));
K=inv(R)*10000/35;
R=Q';
function [ABB,H]=homographyget(x_init, y_init, npoints)
    ABB=[];
    for i=1:npoints
        x=x_init(:,i);
        y=y_init(:,i);
        temp=Atran(x,y);
        if isempty(ABB)
            ABB=temp;
        else
            ABB=[ABB;temp];
        end
    end
    [~,~,V]=svd(ABB);
    [~,width]=size(V);
    h=V(:,width);
    n=norm(h);
    h=h/n;
    H=[h(1:4,1)';h(5:8,1)';h(9:12,1)'];
end
function [x]=Atran(x,y)
    x=[0,0,0,0,-x(1),-x(2),-x(3),-1,y(2)*x(1),y(2)*x(2),y(2)*x(3),y(2);
        x(1),x(2),x(3),1,0,0,0,0,-y(1)*x(1),-y(1)*x(2),-y(1)*x(3),-y(1)];
end