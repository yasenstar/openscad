// union of two spheres implicit
translate([0,0,-30]) {
    sphere(r=10);
    translate([10,0,0])
        sphere(r=10);
}

// union of two spheres explicit
union() {
    sphere(r=10);
    translate([10,0,0])
        sphere(r=10);
}