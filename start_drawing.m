turtle_reset = rossvcclient('/reset')
call(turtle_reset);
twist = rosmessage('geometry_msgs/Twist');
objetivo = rosmessage('geometry_msgs/Twist');
pub = rospublisher('/turtle1/cmd_vel');
sub = rossubscriber('/turtle1/pose');
erroAngularGrande = 0.1;
erroMax = 0.2;
erroAngularPequeno =0.01;
erro = 10;
objetivosX = [5,3,8,2,7,5];
objetivosY = [8,3,6,6,3,8];
posedata = receive(sub,0.1);
erroAngular = atan2((Y- posedata.Y) , (X-posedata.X));
for i = 1:6
    erro = 10;
    erroAngular = 10;
    X = objetivosX(i);
    Y = objetivosY(i);
    while abs(posedata.Theta - erroAngular) > erroAngularGrande
            posedata = receive(sub);
            erroAngular = atan2((Y- posedata.Y) , (X-posedata.X)) ;
            showdetails(posedata);

            twist.Angular.Z =  erroAngular*2;

            disp(twist.Angular.Z);
            send(pub,twist);
    end
    twist.Angular.Z = 0;
    send(pub,twist);
    while abs(posedata.Theta - erroAngular) > erroAngularPequeno
            posedata = receive(sub);
            erroAngular = atan2((Y- posedata.Y) , (X-posedata.X)) ;
            showdetails(posedata);

            twist.Angular.Z =  erroAngular/4;

            disp(twist.Angular.Z);
            send(pub,twist);
    end
    twist.Angular.Z = 0;
    send(pub,twist);
   
    while erro > erroMax
            posedata = receive(sub,0.1);
            showdetails(posedata);
            erro =  (((X- posedata.X).^2 + (Y-posedata.Y).^2).^(1/2))*3;
            twist.Linear.X = erro;
            send(pub,twist);
    end
    twist.Linear.X = 0;
    send(pub,twist);
end