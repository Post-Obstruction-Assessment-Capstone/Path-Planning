function animatepath(fullpath,map)

% h=figure
show(map)
view(100,45)


H_drone = 0.1;
L_drone = 0.2;
m = size(fullpath,1);
hold on
for i=1:m
    q_center = fullpath(i,1:3);

    eul = [fullpath(i,4),fullpath(i,5),fullpath(i,6)];
    rotm = eul2rotm(eul);
%     tmpdisp = [delx(i),dely(i),delz(i),0,0,0];
    can_top = rotm*[0;0;H_drone/2];
    can_bottom = rotm*[0;0;-H_drone/2] ;

%     q_center = q_n(1:3) + tmpdisp(1:3);
    q_top = q_center + can_top';
    q_bottom = q_center + can_bottom';
    ptx = [q_top(1),q_center(1),q_bottom(1)];
    pty = [q_top(2),q_center(2),q_bottom(2)];
    ptz = [q_top(3),q_center(3),q_bottom(3)];

    plot3(ptx,pty,ptz,'k-','LineWidth',2)
    hold on

    vec1 = q_top - q_bottom;
    nullvec = null(vec1(:).');
    disp_up = transpose(L_drone*nullvec(:,1));
    disp_down = transpose(-L_drone*nullvec(:,1));
    disp_left = transpose(L_drone*nullvec(:,2));
    disp_right = transpose(-L_drone*nullvec(:,2));
    
    q_topL = q_top + disp_left;
    q_topR = q_top + disp_right;
    q_topU = q_top + disp_up;
    q_topD = q_top + disp_down;

    q_midL = q_center + disp_left;
    q_midR = q_center + disp_right;
    q_midU = q_center + disp_up;
    q_midD = q_center + disp_down;

    q_botL = q_bottom + disp_left;
    q_botR = q_bottom + disp_right;
    q_botU = q_bottom + disp_up;
    q_botD = q_bottom + disp_down;

    ptx = [q_topL(1),q_top(1),q_topR(1)];
    pty = [q_topL(2),q_top(2),q_topR(2)];
    ptz = [q_topL(3),q_top(3),q_topR(3)];
    plot3(ptx,pty,ptz,'g-','LineWidth',2)

    ptx = [q_topU(1),q_top(1),q_topD(1)];
    pty = [q_topU(2),q_top(2),q_topD(2)];
    ptz = [q_topU(3),q_top(3),q_topD(3)];
    plot3(ptx,pty,ptz,'g-','LineWidth',2)

    ptx = [q_midL(1),q_center(1),q_midR(1)];
    pty = [q_midL(2),q_center(2),q_midR(2)];
    ptz = [q_midL(3),q_center(3),q_midR(3)];
    plot3(ptx,pty,ptz,'b-','LineWidth',2)

    ptx = [q_midU(1),q_center(1),q_midD(1)];
    pty = [q_midU(2),q_center(2),q_midD(2)];
    ptz = [q_midU(3),q_center(3),q_midD(3)];
    plot3(ptx,pty,ptz,'b-','LineWidth',2)

    ptx = [q_botL(1),q_bottom(1),q_botR(1)];
    pty = [q_botL(2),q_bottom(2),q_botR(2)];
    ptz = [q_botL(3),q_bottom(3),q_botR(3)];
    plot3(ptx,pty,ptz,'r-','LineWidth',2)

    ptx = [q_botU(1),q_bottom(1),q_botD(1)];
    pty = [q_botU(2),q_bottom(2),q_botD(2)];
    ptz = [q_botU(3),q_bottom(3),q_botD(3)];
    plot3(ptx,pty,ptz,'r-','LineWidth',2)
    
%     make_animation( h,i,'view100-45.gif' )
    pause(0.01)

end

end


function make_animation( h,index,filename )
drawnow
frame = getframe(h);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
if index == 1
    imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
else
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end
end