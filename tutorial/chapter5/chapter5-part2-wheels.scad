//$fa=1;
//$fs=0.4;

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