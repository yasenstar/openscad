// a special wall anchor with lost of adjustments
// (all sizes in millimenter)

module wall_anchor(
    drill_hole_dm = 8,  // drill hole diameter
    screw_dm = 5,       // screw diameter
    length = 50,     // anchor length
    oversize = 2,   // outer diameter oversize
    outer_taper = 0.75     // outer taper factor
) {
    outer_dm = drill_hole_dm + oversize;
    side_length = sqrt( pow(drill_hole_dm, 2 ) / 2 );
    
    linear_extrude( height = length )
        square( side_length, center = true);
    }

wall_anchor();