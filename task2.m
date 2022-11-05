% P(ID) Controller on X-axis TurtleSim
reset_world_service_turtlesim();

setpoint = 9.0;

kp = 1.0;
ki = 1.0;
kd = 1.0;
 
twist = rosmessage('geometry_msgs/Twist');

pub = rospublisher('/turtle1/cmd_vel');

sub = rossubscriber('/turtle1/pose');

% force a do while behavior
dist = 10;

while dist > 0.1
    position = receive(sub);
    
    dist = setpoint - position.X;
    
    twist.Linear.X = kp * dist;
    
    send(pub, twist);
end