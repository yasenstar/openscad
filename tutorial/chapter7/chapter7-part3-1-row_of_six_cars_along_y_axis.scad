use <self/vehicle_parts.scad>

$fn=100;

module car(track=30, wheelbase=40) {
    // Body
    body();

    // Front left wheel 
    translate([-wheelbase/2,-track/2,0])
        rotate([0,0,0])
        simple_wheel();
     // Front right wheel 
    translate([-wheelbase/2,track/2,0])
        rotate([0,0,0])
        simple_wheel();
    // Rear left wheel 
    translate([wheelbase/2,-track/2,0])
        rotate([0,0,0])
        simple_wheel();
    // Rear right wheel 
    translate([wheelbase/2,track/2,0])
        rotate([0,0,0])
        simple_wheel();
        
    // Front axle 
    translate([-wheelbase/2,0,0])
        axle(track=track); 
    // Rear axle 
    translate([wheelbase/2,0,0])
        axle(track=track);
}

n = 20; // number of cars
y_spacing = 50;
for (dy=[0:y_spacing:n*(y_spacing-1)]) {
    // question: n*y_spacing-1 vs n*(y_spacing-1)
    translate([0,dy,0])
        car();
}