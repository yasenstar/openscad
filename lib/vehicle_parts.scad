//$fa=1;
//$fs=0.4;
$fn=100;

base_height = 10;
top_height = 15;

// Simple Wheel
module simple_wheel(wheel_radius=10, wheel_width=6) {
    rotate([90,0,0])
        cylinder(h=wheel_width,r=wheel_radius,center=true);
    }
translate([30,0,0])
    simple_wheel();

// Complex Wheel
module complex_wheel(wheel_radius=10, side_spheres_radius=50, hub_thickness=4, cylinder_radius=2) {
    cylinder_height=2 * wheel_radius;
    difference() {
        // Wheel sphere
       sphere(r=wheel_radius);
        // Side wheel 1
        translate([0,side_spheres_radius + hub_thickness/2, 0])
            sphere(r=side_spheres_radius);
        // Side wheel 2
        translate([0,-(side_spheres_radius + hub_thickness/2), 0])
            sphere(r=side_spheres_radius);
        //Cylinder 1
        translate([wheel_radius/2, 0, 0])
            rotate([90,0,0])
                cylinder(h=cylinder_height, r=cylinder_radius, center=true);
        //Cylinder 2
        translate([-wheel_radius/2, 0, 0])
            rotate([90,0,0])
                cylinder(h=cylinder_height, r=cylinder_radius, center=true);
        //Cylinder 1
        translate([0,0,wheel_radius/2])
            rotate([90,0,0])
                cylinder(h=cylinder_height, r=cylinder_radius, center=true);
        //Cylinder 1
        translate([0,0,-wheel_radius/2])
            rotate([90,0,0])
                cylinder(h=cylinder_height, r=cylinder_radius, center=true);
    }
}
complex_wheel();

//Spokes Wheel
module spoked_wheel(radius=12, width=5, thickness=5, number_of_spokes=7, spoke_radius=1.5) {
    rotate([90,0,0]) {
    // Ring
    inner_radius = radius - thickness/2;
    difference() {
    cylinder(h=width, r=radius, center=true);
    cylinder(h=width + 1, r=inner_radius, center=true);
    }
    
    // Spokes
    spoke_length = radius - thickness / 4;
    step = 360 / number_of_spokes;
    for (i=[0:step:359]) {
        angle = i;
        rotate([0,90,angle])
            cylinder(h=spoke_length, r=spoke_radius);
        }
    }
}

translate([60,0,0])
    spoked_wheel();

// Simple car body with two cubes
module simple_body(base_length=60, top_length=30, top_offset=base_height/2+top_height/2-0.001) {
    // Car body base
    cube([base_length,20,base_height],center=true);

    // Car body top
    translate([5,0,top_offset])
        cube([top_length,20,top_height],center=true);
}

// Car body with front and rear bumper
module body(base_height=10, top_height=14, base_length=60, top_length=30, width=20, top_offset=5, top=true, front_bumper=true, rear_bumper=true) {
    // Car body base
    color("silver") {
        cube([base_length, width, base_height], center=true);
    }
    
    // Car body top
    if (top) {
        color("red") {
        translate([top_offset, 0, base_height/2+top_height/2-0.001])
            cube([top_length, width, top_height], center=true);
        }
    }
    
    // Front bumper
    if (front_bumper){
    color("blue") {
        translate([-base_length/2, 0,0])
            rotate([90,0,0]) {
                cylinder(h=width - base_height, r = base_height/2, center=true);
                translate([0,0,(width - base_height)/2])
                    sphere(r=base_height/2);
                translate([0,0,-(width - base_height)/2])
                    sphere(r=base_height/2);
            }
        }
    }
    
    // Rear bumper
    if (rear_bumper) {
    color("blue") {
        translate([base_length/2, 0,0])
            rotate([90,0,0]) {
                cylinder(h=width - base_height, r = base_height/2, center=true);
                translate([0,0,(width - base_height)/2])
                    sphere(r=base_height/2);
                translate([0,0,-(width - base_height)/2])
                    sphere(r=base_height/2);
            }
        }
    }
}

translate([0,0,20])
    body();

module rounded_car_body(length=80, rear_height=20, rear_width=25, scaling_factor=0.5, rounded=false) {
    
    // center part
    rotate([0,-90,0])
        linear_extrude(height=length,center=true,scale=scaling_factor)
            resize([rear_height, rear_width])
                circle(d=rear_height);
    
    if (rounded) {
        // rear part
        resize([rear_height, rear_width, rear_height])
            translate([length/2,0,0])
                sphere(d=rear_height);
     
        // front part
        translate([-length/2,0,0])
        scale(scaling_factor)
        resize([rear_height, rear_width, rear_height])
        sphere(d=rear_height);
    }
}

translate([0,0,-30])
    rounded_car_body(rounded=true);

// Car axle
module axle(track=30, radius=2) {
    rotate([90,0,0])
        cylinder(h=track,r=radius,center=true);
}

axle();