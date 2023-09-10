//intersection of two spheres
intersection() {
    sphere(r=10);
    translate([12,0,0])
        sphere(r=10);
}

//intersection of three spheres
translate([0,0,-40])
intersection() {
    sphere(r=10);
    translate([12,0,0])
        sphere(r=10);
    translate([0,-12,0])
        sphere(r=10);
}