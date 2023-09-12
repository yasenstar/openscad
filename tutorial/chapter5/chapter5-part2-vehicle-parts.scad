//$fa=1;
//$fs=0.4;

base_height = 10;
top_height = 10;

module simple_wheel(wheel_radius=10, wheel_width=6) {
    rotate([90,0,0])
        cylinder(h=wheel_width,r=wheel_radius,center=true);
    }
translate([30,0,0])
    simple_wheel();

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

module body(base_length=60, top_length=30, top_offset=base_height/2+top_height/2-0.001) {
    // Car body base
    cube([base_length,20,base_height],center=true);

    // Car body top
    translate([5,0,top_offset])
        cube([top_length,20,top_height],center=true);
}

translate([0,0,20])
    body();

module axle(track=30) {
    rotate([90,0,0])
        cylinder(h=track,r=2,center=true);
}

axle();