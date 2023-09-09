//$fa = 1;
//$fs = 0.4;
//sphere(r=10);

// set resolution
$fa = 1;
$fs = 0.4;

// parameters
base_height = 8;
top_height = 10;
wheel_radius = 8;
wheel_width = 4;
track = 30;
front_wheel_rotate = -20;
rear_wheel_rotate = 20;

// Cylinder Body
// car body base
//cube([60,20,base_height],center=true);
// car body top
//translate([5,0,base_height/2 + top_height/2 - 0.001])
//     cube([30,20,top_height],center=true);
     
// Sphere Body
// car body base
resize([60,25,base_height*2.5])
    sphere(d=base_height);
// car body top
translate([5,0,7])
     resize([30,15,top_height*2])
        sphere(d=top_height);
    
// front left wheel
translate([-20,-track/2,0])
// if cylinder wheel
//  rotate([90,0,front_wheel_rotate])
//    cylinder(h=wheel_width,r=wheel_radius,center=true);
// if sphere wheel
    rotate([0,0,front_wheel_rotate])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
            sphere(wheel_radius);
    
// front right wheel
translate([-20,track/2,0])
// if cylinder wheel
//    rotate([90,0,front_wheel_rotate])
//    cylinder(h=wheel_width,r=wheel_radius,center=true);
// if sphere wheel
    rotate([0,0,front_wheel_rotate])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
            sphere(wheel_radius);

// rear left wheel
translate([20,-track/2,0])
// if cylinder wheel
//    rotate([90,0,rear_wheel_rotate])
//    cylinder(h=wheel_width,r=wheel_radius,center=true);
// if sphere wheel
    rotate([0,0,rear_wheel_rotate])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
            sphere(wheel_radius);
    
// rear right wheel
translate([20,track/2,0])
// if cylinder wheel
//    rotate([90,0,rear_wheel_rotate])
//    cylinder(h=wheel_width,r=wheel_radius,center=true);
// if sphere wheel
    rotate([0,0,rear_wheel_rotate])
        resize([2*wheel_radius,wheel_width,2*wheel_radius])
            sphere(wheel_radius);

// front axles
translate([-20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);

// rear axles
translate([20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);