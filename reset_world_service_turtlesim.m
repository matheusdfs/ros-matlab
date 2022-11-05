function reset_world_service_turtlesim()
    reset_world = rossvcclient('/reset');
    call(reset_world);
end