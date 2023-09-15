$fn = 100;

module rounded_car_body(length=80, rear_height=20, rear_width=25, scaling_factor=0.5) {
    rotate([0,-90,0])
        linear_extrude(height=length,center=true,scale=scaling_factor)
            resize([rear_height, rear_width])
                circle(d=rear_height);
}

rounded_car_body();