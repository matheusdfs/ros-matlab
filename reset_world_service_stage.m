function reset_world_service_stage()
    reset_world = rossvcclient('/reset_positions');
    call(reset_world);
end