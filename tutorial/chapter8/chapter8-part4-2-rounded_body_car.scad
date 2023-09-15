use <self/vehicle_parts.scad>

// Variables
track = 40;
wheelbase = 40;

// Body
rounded_car_body(rounded=true);

// Front left wheel 
translate([-wheelbase/1.5,-track/2,0])
    rotate([0,0,0])
    spoked_wheel();
 // Front right wheel 
translate([-wheelbase/1.5,track/2,0])
    rotate([0,0,0])
    spoked_wheel();
// Rear left wheel 
translate([wheelbase/1.5,-track/2,0])
    rotate([0,0,0])
    spoked_wheel();
// Rear right wheel 
translate([wheelbase/1.5,track/2,0])
    rotate([0,0,0])
    spoked_wheel();
    
// Front axle 
translate([-wheelbase/1.5,0,0])
    axle(track=track); 
// Rear axle 
translate([wheelbase/1.5,0,0])
    axle(track=track);