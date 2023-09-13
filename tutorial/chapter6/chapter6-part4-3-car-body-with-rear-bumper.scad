module body(base_height=10, top_height=14, base_length=60, top_length=30, width=20, top_offset=5, top=true, front_bumper=true, rear_bumper=true) {
    // Car body base
    color("silver") {
        cube([base_length, width, base_height], center=true);
    }
    
    // Car body top
    if (top) {
        color("red") {
        translate([top_offset, 0, base_height/2+top_height/2-0.001])
            cube([top_length, width, top_height], center=true);
        }
    }
    
    // Front bumper
    if (front_bumper){
    color("blue") {
        translate([-base_length/2, 0,0])
            rotate([90,0,0]) {
                cylinder(h=width - base_height, r = base_height/2, center=true);
                translate([0,0,(width - base_height)/2])
                    sphere(r=base_height/2);
                translate([0,0,-(width - base_height)/2])
                    sphere(r=base_height/2);
            }
        }
    }
    
    // Rear bumper
    if (rear_bumper) {
    color("blue") {
        translate([base_length/2, 0,0])
            rotate([90,0,0]) {
                cylinder(h=width - base_height, r = base_height/2, center=true);
                translate([0,0,(width - base_height)/2])
                    sphere(r=base_height/2);
                translate([0,0,-(width - base_height)/2])
                    sphere(r=base_height/2);
            }
        }
    }
}

//body(top=true, front_bumper=true, rear_bumper=false);

body();