$fa = 1;
$fs = 0.4;

// rotate front wheel for 20 degree

// car body base
cube([60,20,10],center=true);
// car body top
translate([5,0,10 - 0.001])
    cube([30,20,10],center=true);
  
// front left wheel
translate([-20,-15,0])
    rotate([90,0,-20])
    cylinder(h=3,r=8,center=true);
    
// front right wheel
translate([-20,15,0])
    rotate([90,0,-20])
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
