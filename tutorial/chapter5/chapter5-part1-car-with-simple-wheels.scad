wheel_radius = 8;
wheel_width=3;
base_height = 10;
top_height = 10;
track = 30;

// Car body base
cube([60,20,base_height],center=true);

// Car body top
translate([5,0,base_height/2+top_height/2-0.001])
    cube([30,20,top_height],center=true);
    
// Front left wheel
translate([-20,-track/2,0])
    rotate([90,0,0])
        cylinder(h=wheel_height,r=wheel_radius,center=true);

// Front right wheel
translate([-20,track/2,0])
    rotate([90,0,0])
        cylinder(h=wheel_height,r=wheel_radius,center=true);
        
// Rear left wheel
translate([20,-track/2,0])
    rotate([90,0,0])
        cylinder(h=wheel_height,r=wheel_radius,center=true);

// Rear right wheel
translate([20,track/2,0])
    rotate([90,0,0])
        cylinder(h=wheel_height,r=wheel_radius,center=true);

// Front axle
translate([-20,0,0])
    rotate([90,0,0])
        cylinder(h=track,r=2,center=true);

// Rear axle
translate([20,0,0])
    rotate([90,0,0])
        cylinder(h=track,r=2,center=true);