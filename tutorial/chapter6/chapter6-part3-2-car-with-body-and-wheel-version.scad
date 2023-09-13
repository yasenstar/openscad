use <self/vehicle_parts.scad>
$fn=100;

// Conditional assignment of body variables
// L - Long, S - Short, R - Rectangle, N - Normal
body_version = "n";

// base_length
base_length =
(body_version == "l") ? 80:
(body_version == "s") ? 60:
(body_version == "r") ? 65:70;

// top_length
top_length =
(body_version == "l") ? 50:
(body_version == "s") ? 30:
(body_version == "r") ? 65:40;

// top_offset
top_offset =
(body_version == "l") ? 10:
(body_version == "s") ? 5:
(body_version == "r") ? 0:7.5;

// Creation of body
body(base_length=base_length, top_length=top_length, top_offset=top_offset);

// Conditional assignment of wheel variables
// S - Small, M - Medium, L - Large
wheels_version = "s";

wheel_radius =
(wheels_version == "l") ? 10 :
(wheels_version == "m") ? 8 : 6;

wheel_width =
(wheels_version == "l") ? 8 :
(wheels_version == "m") ? 6 : 4;

// Creation of wheels and axles
large_wheels = false;
track = 30;
wheelbase = 40;
//wheel_radius = (large_wheels) ? 10: 6;
//wheel_width = (large_wheels) ? 8 : 4;
// Front left wheel 
translate([-wheelbase/2,-track/2,0])
    rotate([0,0,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);
 // Front right wheel 
translate([-wheelbase/2,track/2,0])
    rotate([0,0,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);
// Rear left wheel 
translate([wheelbase/2,-track/2,0])
    rotate([0,0,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);
// Rear right wheel 
translate([wheelbase/2,track/2,0])
    rotate([0,0,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);
// Front axle 
translate([-wheelbase/2,0,0])
    axle(track=track); 
// Rear axle 
translate([wheelbase/2,0,0])
    axle(track=track);