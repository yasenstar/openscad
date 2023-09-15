use <self/vehicle_parts.scad>

// Variables
track = 40;
wheelbase = 35;

half_wheelbase = wheelbase/2;
half_track = track/2;

// Body
body();

// Front left wheel 
translate([-half_wheelbase,-half_track,0])
    simple_wheel();
 // Front right wheel 
translate([-half_wheelbase,half_track,0])
    simple_wheel();
// Rear left wheel 
translate([half_wheelbase,-half_track,0])
    simple_wheel();
// Rear right wheel 
translate([half_wheelbase,half_track,0])
    simple_wheel();
    
// Front axle 
translate([-half_wheelbase,0,0])
    axle(track=track); 
// Rear axle 
translate([half_wheelbase,0,0])
    axle(track=track);