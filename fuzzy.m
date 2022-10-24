reset_world = rossvcclient('/reset_positions');
call(reset_world);

sub = rossubscriber('/robot_0/base_scan');

while 1
    info = receive(sub);
    disp(info.Ranges);
    teste = info.Ranges;

end