// dimensions in millimeter [width, depth, height]
plate = [100, 50, 5];

hole_dm = 6;
hole_margin = 4;

difference() {
    cube(plate);
    
    abs_margin = hole_margin + hole_dm / 2;

    // lower left hole
    translate([abs_margin, abs_margin, -1])
    color( "red" )
        cylinder( h = plate.z + 2, d = hole_dm);
    
    // lower right hole
    translate([plate.x - abs_margin, abs_margin, -1])
    color( "red" )
        cylinder( h = plate.z + 2, d = hole_dm);
    
    // upper left hole
    translate([abs_margin, plate.y - abs_margin, -1])
    color( "red" )
        cylinder( h = plate.z + 2, d = hole_dm);
    
    // upper right hole
    translate([plate.x - abs_margin, plate.y - abs_margin, -1])
    color( "red" )
        cylinder( h = plate.z + 2, d = hole_dm);
}

//echo(plate.x, plate.y, plate.z);
//echo(plate[0], plate[1], plate[2]);