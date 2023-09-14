use <self/vehicle_parts.scad>

//$fn=100;

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

nRows = 5;
for (i=[1:1:nRows]) {
        r = 70 + i *70;
        n = 12 + i * 1;
        step = 360/n;
        for (angle=[0:step:359]) {
            dx = r * cos(angle);
            dy = r * sin(angle);
            translate([dx,dy,0])
                rotate(angle)
                car();
}
}