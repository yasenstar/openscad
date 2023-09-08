// cube(10);

// cube([25,35,55]);

//cube([23,30,55],center=true);

//% cube([60,20,10],center=true);
//translate([0,0,10-0.001])
//    cube([30,20,10],center=true);

//cube([60,20,10],center=true);
//translate([0,0,10])
//    cube([30,20,10],center=true)
//translate([0,0,5])
//    cube([30,20,0.002],center=true);

// set resolution
$fa = 1;
$fs = 0.4;

// car body
cube([60,20,10],center=true);
translate([5,0,10 - 0.001])
    cube([30,20,10],center=true);
    
// front left wheel
translate([-20,-15,0])
    rotate([90,0,0])
    cylinder(h=3,r=8,center=true);
    
// front right wheel
translate([-20,15,0])
    rotate([90,0,0])
    cylinder(h=3,r=8,center=true);

// rear left wheel
translate([20,-15,0])
    rotate([90,0,0])
    cylinder(h=3,r=8,center=true);
    
// rear right wheel
translate([20,15,0])
    rotate([90,0,0])
    cylinder(h=3,r=8,center=true);

// front axles
translate([-20,0,0])
    rotate([90,0,0])
    cylinder(h=30,r=2,center=true);

// rear axles
translate([20,0,0])
    rotate([90,0,0])
    cylinder(h=30,r=2,center=true);