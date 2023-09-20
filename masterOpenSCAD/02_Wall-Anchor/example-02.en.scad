


// a special wall anchor with lots of adjustments
// (all sizes in millimeter)

module wall_anchor (
    drill_hole_dm,          // drill hole diameter
    screw_dm,               // screw diameter
    length,                 // anchor length
    oversize        = 2,    // outer diameter oversize
    outer_taper     = 0.75, // outer taper factor
    inner_taper     = 0.2,  // inner taper factor
    inner_taper_end = 0.3,  // relative end of inner taper along length
    collar          = 0.1,  // relative length of initial non-slit part
    slit            = 0.5,  // slit width
    cap_size        = 2,    // length of the end cap
    teeth_div       = 5,    // divisor determining the number of teeth
    teeth_depth     = 1.5,  // depth of the teeth
    round_shape     = false // make the anchor round instead of square
){

	difference() {

        outer_dm = drill_hole_dm + oversize;
	    side_length   = 
            round_shape ? outer_dm : sqrt( pow(outer_dm, 2) / 2 );

	    linear_extrude( height = length, scale = outer_taper )
	    if ( round_shape )
	    	circle( d = side_length, $fn=36 );
	    else
	    	square( side_length, center = true );

	    // hole
	    abs_taper_end = length * inner_taper_end;
	    taper_dm      = screw_dm * inner_taper;

	    translate( [0, 0, -0.01] )
	    union() {
	        $fn = 24;
            
	        cylinder( d1 = screw_dm, d2 = taper_dm, h = abs_taper_end + 0.01);
	        
	        translate( [0, 0, abs_taper_end] )
	        cylinder( d = taper_dm, h = length - abs_taper_end + 0.02 );
	    }


        // slits
        abs_collar = length * collar;
        
        for (i = [0:1])
        rotate( [0, 0, i * 90] )
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
        
        // teeth
        teeth_count = floor( (length - abs_collar) / teeth_div );
        teeth_dist  = (length - abs_collar) / (teeth_count + 1);
        
        opposite = (outer_dm - (outer_dm * outer_taper)) / 2;
        hypotenuse  = sqrt( pow(opposite, 2) + pow(length, 2) );
        angle = asin( opposite / hypotenuse );
        
        diag_dist = sqrt( pow(outer_dm/2 - teeth_depth, 2) / 2 );
                
        for ( j = [0:90:359] )
        rotate( [0, 0, j] )
        rotate( -angle, [1,1,0] )
        for (i = [1:teeth_count] )
        translate( [diag_dist, -diag_dist, abs_collar + i * teeth_dist] )
        rotate([0,0,-45])
        translate( [0, -outer_dm / 2, 0] )
        rotate([0,45,0])
        cube( outer_dm );        
	    
	}

}

wall_anchor(8,4,40, inner_taper = 0.33, round_shape = false);

