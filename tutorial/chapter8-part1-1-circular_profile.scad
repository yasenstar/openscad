$fn=100;

wheel_radius = 12;

tyre_diameter = 6;

translate([wheel_radius - tyre_diameter/2, 0])
    circle(d=tyre_diameter);