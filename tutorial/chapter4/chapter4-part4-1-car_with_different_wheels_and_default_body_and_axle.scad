module body(base_height=10, top_height=14, base_length=60, top_length=30, width=20, top_offset=5) {   
    // Car body base
    cube([base_length,width,base_height],center=true);
    // Car body top
    translate([top_offset,0,base_height/2+top_height/2 - 0.001])
        cube([top_length,width,top_height],center=true);
}

module wheel(wheel_radius, side_spheres_radius, hub_thickness, cylinder_radius) {
    cylinder_height = 2 * wheel_radius;
    difference() {
        sphere(r=wheel_radius);
        translate([0,side_spheres_radius+hub_thickness/2,0])
            sphere(r=side_spheres_radius);
        translate([0,-(side_spheres_radius+hub_thickness/2),0])
            sphere(r=side_spheres_radius);
        // cylinder 1
        translate([0,0,wheel_radius/2])
            rotate([90,0,0])
                 cylinder(h=cylinder_height,r=cylinder_radius,center=true);
        // cylinder 2
        translate([0,0,-wheel_radius/2])
            rotate([90,0,0])
                 cylinder(h=cylinder_height,r=cylinder_radius,center=true);
        // cylinder 3
        translate([wheel_radius/2,0,0])
            rotate([90,0,0])
                 cylinder(h=cylinder_height,r=cylinder_radius,center=true);
        // cylinder 4
        translate([-wheel_radius/2,0,0])
            rotate([90,0,0])
                 cylinder(h=cylinder_height,r=cylinder_radius,center=true);
    }   
}

module axle(track=35, radius=2) {
    rotate([90,0,0])
        cylinder(h=track,r=radius,center=true);
}

$fa=1;
$fs=0.4;

base_height=10;
top_height=14;
track=35;
wheel_width=10;
body_roll = 0;
wheels_turn = 0;

wheel_radius=10;
side_spheres_radius=50;
hub_thickness=4;
cylinder_radius=2;
cylinder_height=3*wheel_radius;

rotate([body_roll,0,0])
    body();

// Front Left Wheel
translate([-20,-track/2,0])
    wheel(wheel_radius=10, side_spheres_radius=50, hub_thickness=4, cylinder_radius=2);

// Front Right Wheel
translate([-20,track/2,0])
    wheel(wheel_radius=10, side_spheres_radius=50, hub_thickness=4, cylinder_radius=2);

// Rear Left Wheel
translate([20,-track/2,0])
    wheel(wheel_radius=12, side_spheres_radius=30, hub_thickness=8, cylinder_radius=3);

// Rear Right Wheel
translate([20,track/2,0])
    wheel(wheel_radius=12, side_spheres_radius=30, hub_thickness=8, cylinder_radius=3);

// Front axle
translate([-20,0,0])
    axle();
// Rear axle
translate([20,0,0])
    axle();