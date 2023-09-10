// difference of two spheres
translate([0,0,-50])
    difference() {
        sphere(r=10);
        translate([12,0,0])
            sphere(r=10);
    }

// difference of three spheres
offset = 14;
difference() {
    sphere(r=10);
    translate([offset,0,0])
        sphere(r=10);
    translate([0,-offset,0])
        sphere(r=10);
    translate([-offset,0,0])
        sphere(r=10);
    translate([0,offset,0])
        sphere(r=10);
    translate([0,0,offset])
        sphere(r=10);
    translate([0,0,-offset])
        sphere(r=10);
}