color([1,0,0], 0.3)
translate([30,0,0])
sphere(r=10);

color([0,0,0])
translate([0,0,-15])
cylinder(30, 0.1, 0.1);

color([0,0,0])
translate([30,0,-15])
cylinder(30, 0.1, 0.1);

difference() {

color([0,1,0], 0.3)
cylinder(9.9, 10, 10);

color([0,0,1], 0.5)
cylinder(10, 0, 10);
}

translate([0,0,6]) {
color([0,0,0])
rotate([90,0,0])
cylinder(15, 0.1, 0.1);
    
color([0,0,0])
translate([30,0,0])
rotate([90,0,0])
cylinder(15, 0.1, 0.1);

color([1,1,1], 0.5)
cube([100, 100, 0.1], center=true);
}