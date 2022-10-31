reset_world_service();

sub = rossubscriber('/robot_0/base_scan');

pub = rospublisher('/robot_0/cmd_vel');
  
twist = rosmessage('geometry_msgs/Twist');

fuzzy = readfis('distance_control.fis');

while 1
    sensor = receive(sub);
    [left, center, right] = split_stream(sensor.Ranges);
    
    left = double(min(left));
    center = double(min(center));
    right = double(min(right));
    
    output = evalfis([left center right], fuzzy);
    
    twist.Linear.X = output(2);
    twist.Angular.Z = output(1);
    
    send(pub, twist);    
end