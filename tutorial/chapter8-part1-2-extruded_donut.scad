$fn=100;

wheel_radius = 12;

tyre_diameter = 6;

rotate_extrude(angle=360)
    translate([wheel_radius - tyre_diameter/2, 0])
        circle(d=tyre_diameter);
