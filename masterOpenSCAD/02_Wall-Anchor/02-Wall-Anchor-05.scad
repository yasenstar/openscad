// a special wall anchor with lost of adjustments
// (all sizes in millimenter)

module wall_anchor(
    drill_hole_dm = 8,  // drill hole diameter
    screw_dm = 5,       // screw diameter
    length = 50,     // anchor length
    oversize = 2,   // outer diameter oversize
    outer_taper = 0.75,     // outer taper factor
    inner_taper = 0.2,      // inner taper factore
    inner_taper_end = 0.3,   // relative end of inner tape along length
    collar = 0.1,   // relative length of initial non-slit part
    slit = 0.5,     // slit width
    cap_size = 2    // length of the end up
) {
    
    difference() {
            
        outer_dm = drill_hole_dm + oversize;
        side_length = sqrt( pow(outer_dm, 2 ) / 2 );
        
        linear_extrude( height = length, scale = outer_taper )
           square( side_length, center = true);
            
        // hole
        abs_taper_end = length * inner_taper_end;
        taper_dm = screw_dm * inner_taper;
        
        translate( [0,0,-0.01])
        union() {
            $fn = 24;
            
            cylinder(d1 = screw_dm, d2 = taper_dm, h = abs_taper_end + 0.01);
            
            translate( [ 0, 0, abs_taper_end ])
            cylinder(d1 = taper_dm, h = length - abs_taper_end + 0.02);
        }
        
        // slits
        abs_collar = length * collar;
        
        for (i = [0:1])
            rotate( [ 0, 0, i * 90])
            translate([
                -(side_length + 2) / 2,
                -slit / 2,
                abs_collar
            ])
            cube ([
                side_length + 2,
                slit,
                length - cap_size - abs_collar
        ]);
    }
}

wall_anchor();

