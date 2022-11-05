% Movimentation in TurtleSim using keyboard
reset_world_service_turtlesim();

t0 = clock;
 
twist = rosmessage('geometry_msgs/Twist');

pub = rospublisher('/turtle1/cmd_vel');
 
while etime(clock, t0) < 30
    [CH, DT] = getkeywait(1);
 
    if CH == 30
        twist.Linear.X = 0.5;
        twist.Angular.Z = 0;
        disp('frente')
    end
 
    if CH == 31
        twist.Linear.X = 0;
        twist.Angular.Z = 0;
        disp('parou')
    end
 
     if CH == 28
        twist.Linear.X = 0;
        twist.Angular.Z = pi/3;
        disp('esquerda')
     end
 
     if CH == 29
        twist.Linear.X = 0;
        twist.Angular.Z = -pi/3;
        disp('direita')
    end
 
    send(pub,twist)
 
end