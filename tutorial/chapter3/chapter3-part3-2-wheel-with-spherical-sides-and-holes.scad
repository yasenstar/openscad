$fa=1;
$fs=0.4;

wheel_radius=10;
side_spheres_radius=50;
hub_thickness=4;
cylinder_radius=2;
cylinder_height=3*wheel_radius;

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