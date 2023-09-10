$fa=1;
$fs=0.4;

module wheel(wheel_radius=10, side_spheres_radius=50, hub_thickness=4, cylinder_radius=2) {
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

// If a parameter’s value is not specified when calling the wheel module, the default value for this parameter is used
//wheel();

// wheel(hub_thickness=8);

//wheel(hub_thickness=8, wheel_radius=15);

//wheel(side_spheres_radius=15, hub_thickness=10);

wheel(side_spheres_radius=10);