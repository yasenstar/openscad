// cube(10);

// cube([25,35,55]);

//cube([23,30,55],center=true);

//% cube([60,20,10],center=true);
//translate([0,0,10-0.001])
//    cube([30,20,10],center=true);

cube([60,20,10],center=true);
translate([0,0,10])
    cube([30,20,10],center=true)
translate([0,0,5])
    cube([30,20,0.002],center=true);