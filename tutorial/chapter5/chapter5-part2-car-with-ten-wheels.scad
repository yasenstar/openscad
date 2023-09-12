use <chapter5-part2-vehicle-parts.scad>

$fa=1;
$fs=0.4;

wheel_radius = 8;
wheel_width=4;
base_length=60;
top_length=100;
track = 30;
wheelbase_1 = 38;
wheelbase_2 = 72;
z_offset=10;

body(base_length=base_length, top_length=top_length, top_offset=10); 
    
// Front left wheel
translate([-wheelbase_2/2,-track/2,z_offset])
    complex_wheel();

// Front right wheel
translate([-wheelbase_2/2,track/2,z_offset])
    complex_wheel();
    
// Rear left wheel
translate([wheelbase_2/2,-track/2,z_offset])
    complex_wheel();

// Rear right wheel
translate([wheelbase_2/2,track/2,z_offset])
    complex_wheel();

// Front axle
translate([-wheelbase_2/2,0,z_offset])
    axle(track=track);

// Rear axle
translate([wheelbase_2/2,0,z_offset])
    axle(track=track);
        
// Middle front left wheel
translate([-wheelbase_1/2,-track/2,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);

// Middle front right wheel
translate([-wheelbase_1/2,track/2,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);

// Middle middle left wheel
translate([0,-track/2,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);

// Middle middle right wheel
translate([0, track/2,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);

// Middle rear left wheel
translate([wheelbase_1/2,-track/2,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);

// Middle rear right wheel
translate([wheelbase_1/2,track/2,0])
    simple_wheel(wheel_radius=wheel_radius, wheel_width=wheel_width);

// Middle front axle
translate([-wheelbase_1/2,0,0])
    rotate([90,0,0])
        cylinder(h=track,r=2,center=true);

// Middle middle axle
translate([0,0,0])
    rotate([90,0,0])
        cylinder(h=track,r=2,center=true);
        
// Middl rear axle
translate([wheelbase_1/2,0,0])
    rotate([90,0,0])
        cylinder(h=track,r=2,center=true);