module body(base_height=10, top_height=14, base_length=60, top_length=30, width=20, top_offset=5, top=true) {
    // Car body base
    cube([base_length, width, base_height], center=true);
    // Car body top
    if (top) {
        translate([top_offset, 0, base_height/2+top_height/2-0.001])
            cube([top_length, width, top_height], center=true);
    }
}

body(top=false);