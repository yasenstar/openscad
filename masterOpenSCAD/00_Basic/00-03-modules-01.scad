module hole_plate( size=[100,50,5], hole_dm=6, hole_margin=4) {
    
    difference() {
        cube(size);
        
        abs_margin = hole_margin + hole_dm / 2;
        x_hole_dist = size.x - 2 * abs_margin;
        y_hole_dist = size.y - 2 * abs_margin;
        x_values = [abs_margin : x_hole_dist : size.x - abs_margin];
        y_values = [abs_margin : y_hole_dist : size.y - abs_margin];
        
        // 4 holes with for loop
        for (x = x_values, y = y_values)
            translate([x, y, -1])
            color( "red" )
                cylinder( h = size.z + 2, d = hole_dm);
    }
}

//hole_plate([80,50,10], 6, 4);

hole_plate();

translate( [0, 60, 0])
hole_plate( size = [50,50,5], hole_margin = 2, hole_dm = 3);

translate( [60, 60, 0])
hole_plate( size = [50,50,5], hole_margin = 15, hole_dm = 5);
