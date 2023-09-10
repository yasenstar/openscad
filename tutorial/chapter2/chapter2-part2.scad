// set resolution
$fa = 1;
$fs = 0.4;

// parameters
base_height = 15;
top_height = 20;
wheel_radius = 8;
wheel_width = 10;
track = 40;
front_wheel_rotate = -20;
rear_wheel_rotate = 20;

// car body base
cube([60,20,base_height],center=true);
// car body top
translate([5,0,base_height/2 + top_height/2 - 0.001])
     cube([30,20,top_height],center=true);
    
// front left wheel
translate([-20,-track/2,0])
    rotate([90,0,front_wheel_rotate])
    cylinder(h=wheel_width,r=wheel_radius,center=true);
    
// front right wheel
translate([-20,track/2,0])
    rotate([90,0,front_wheel_rotate])
    cylinder(h=wheel_width,r=wheel_radius,center=true);

// rear left wheel
translate([20,-track/2,0])
    rotate([90,0,rear_wheel_rotate])
    cylinder(h=wheel_width,r=wheel_radius,center=true);
    
// rear right wheel
translate([20,track/2,0])
    rotate([90,0,rear_wheel_rotate])
    cylinder(h=wheel_width,r=wheel_radius,center=true);

// front axles
translate([-20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);

// rear axles
translate([20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);