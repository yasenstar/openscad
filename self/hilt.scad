scale([1.5,1,1])
    {
    cylinder(10,50,50,center=true);
    difference()
        {
            cylinder(10,100,100,center=true);
            cylinder(10,95,95,center=true);
        }
    for (i = [0:22.5:337.5]) { 
        rotate([0,0,i])
            translate([0,-100,-5])
                cube([5,195,10]);
            }
    }

difference() {
    scale([5,0.5,1])
        cylinder (150, 5, 5);
    translate([10,-10,125])
            cube([20,20,10]);
            }

difference() {
    scale([7,1.1,1])
        translate([0,0,-300])
            cylinder (300, 5, 5);
    translate([20,-10,-90])
                cube([20,20,50]);
}

translate([15,-30,-90])
rotate([0,0,90])
                cube([30,10,50]);