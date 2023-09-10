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

rotate([body_roll,0,0]) {
    // Car body base
    cube([60,20,base_height],center=true);
    // Car body top
    translate([5,0,base_height/2+top_height/2 - 0.001])
        cube([30,20,top_height],center=true);
}

// Front axle
translate([-20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);
// Rear axle
translate([20,0,0])
    rotate([90,0,0])
    cylinder(h=track,r=2,center=true);

translate([20,-track/2,0])
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

translate([-20,-track/2,0])
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

translate([20,track/2,0])
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

translate([-20,track/2,0])
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