function reset_world_service()
    reset_world = rossvcclient('/reset_positions');
    call(reset_world);
end