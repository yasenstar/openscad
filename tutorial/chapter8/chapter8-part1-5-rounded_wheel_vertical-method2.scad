$fn=100;

wheel_radius = 12;
wheel_width = 4;
tyre_diameter = 6;

module rounded_simple_wheel(wheel_radius=12, wheel_width=4, tyre_diameter=6) {
    rotate([90,0,0]) 
    {
        rotate_extrude(angle=360) {
            translate([wheel_radius - tyre_diameter/2, 0])
                circle(d=tyre_diameter);
            translate([0,-wheel_width/2])
                square([wheel_radius-tyre_diameter/2,wheel_width]);
        }
    }   
}

rounded_simple_wheel();