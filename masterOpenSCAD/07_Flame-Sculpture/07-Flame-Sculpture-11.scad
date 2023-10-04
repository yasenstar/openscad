// Program: Flame Sculpture

module flames (
    height,
    scaling_start     = [1.0, 1.0, 1.0],
    scaling_end       = [0.1, 0.1, 0.1],
    x_radius          = 15,
    y_radius          = 10,
    steepness         = 0.2,
    transition        = 0.35,
    height_distortion = 0.7,
    turns             = 1,
    slices            = 30
) {
    
    // positions along the path
    increment = height / slices;
    rot_inc = 360 * turns / slices;
    
    positions = [ for ( i = [0:slices]) [
        cos( i * rot_inc ) * x_radius,
        sin( i * rot_inc ) * y_radius,
        pow( i / slices, height_distortion) * height
    ]];
    
    // scaling along the path
    function sigmoid(x, steepness = 0.5, transition = 0.5) =
        let (
            increment = 1.0 - pow( steepness, 0.1 ),
            starting_point = -transition / increment
        ) 1 / ( 1 + exp( -( x / increment + starting_point) ) );
        
    s_factors = [ for (i = [0:slices]) 
        1.0 - sigmoid( i / slices, steepness, transition ) 
    ];
    
    // angle along the path
    function dot_p(v1, v2, idx) =
        v1[idx] * v2[idx] + (idx > 0 ? dot_p(v1, v2, idx-1) : 0);
    
    function dot_product(v1, v2) = dot_p(v1, v2, len(v1)-1);
    
    function angle( v1, v2 ) = acos(dot_product(v1, v2) / (norm(v1) * norm(v2)));
    
    rel_pos = concat(
        [ positions[0] ],
        [ for (i = [1:slices]) positions[i] - positions[i-1] ]        
    );
    
    pos_angles = concat(
        [0],
        [ for (i = [1:slices-1]) angle( [0,0,1], rel_pos[i]) ],
        [0]
    );
    
    // a single flame
    module flame() {
    
        module slice( i ) {
            translate( positions[i] )
            rotate( pos_angles[i], cross([0,0,1], rel_pos[i]) )
            linear_extrude( height = 2 )
            scale(
                scaling_start * s_factors[i] + scaling_end * (1.0 - s_factors[i])
            )
            children(0);
        }
            
            for ( i = [1:slices])   // change from 1 to 0 to show the bottom circle, checking with author {
                hull() {
                    slice(i-1) children(0);
                    slice(i) children(0);
                }
            }
    
    // flame() children(0); // debug
    
    // flame triplet
    union() {
        flame() children(0);
        
        translate([x_radius,0,0])
        rotate([0,0,120])
        translate([-x_radius,0.0])
        flame() children(0);
        
        translate([x_radius,0,0])
        rotate([0,0,-120])
        translate([-x_radius,0.0])
        flame() children(0);
    }
    
    // end cap
    if ($children > 1) {
        //translate([-x_radius,0,0])
        translate(positions[len(positions)-1])
        scale( 
            scaling_start * s_factors[len(s_factors)-1] +  
            scaling_end * (1.0 - s_factors[len(s_factors)-1])
        )
        children(1);
    }
   
}

// Number 1
flames(180) {
    circle( d = 60, $fn = 30);
   sphere (d = 60);
}

// Number 2
translate( [60, -60, 0])
flames(
    180,
    steepness         = 0.1,
    transition        = 0.3,
    height_distortion = 1.2,
    slices            = 30
    ) {
        scale( [1, 0.33] )
        circle( d = 60 , $fn = 30);
        sphere( d = 120 );
    }

// Number 3
union() {
    translate( [125, -125, 0] )
    flames( 
        180,
        scaling_start     = [1.0, 1.0, 1.0],
        scaling_end       = [0.2, 0.2, 0.2],
        steepness         = 0.3,
        transition        = 0.35,
        height_distortion = 0.5,
        slices            = 30
    ) {
        square( 40, center = true);
        cylinder( d1 = 50, d2 = 0, h = 30);
    }
    
    translate( [125, -125, 0] )
    flames( 
        180,
        scaling_start     = [1.0, 1.0, 1.0],
        scaling_end       = [0.2, 0.2, 0.2],
        steepness         = 0.3,
        transition        = 0.35,
        height_distortion = 0.5,
        slices            = 30
    ) {
        rotate( [0, 0, 30] )
        square( 40, center = true);
        cylinder( d1 = 50, d2 = 0, h = 30);
    }
    
    translate( [125, -125, 0] )
    flames( 
        180,
        scaling_start     = [1.0, 1.0, 1.0],
        scaling_end       = [0.2, 0.2, 0.2],
        steepness         = 0.3,
        transition        = 0.35,
        height_distortion = 0.5,
        slices            = 30
    ) {
        rotate( [0, 0, 60] )
        square( 40, center = true);
        cylinder( d1 = 50, d2 = 0, h = 30);
    }
}

// Number 4
translate( [200, -200, 0] )
flames(
    180,
    scaling_start     = [0.6, 0.6, 1.0],
    scaling_end       = [0.4, 1.0, 1.0],
    x_radius          = 25,
    y_radius          = 15,
    steepness         = 0.8,
    transition        = 0.6,
    height_distortion = 0.8,
    turns = 1.3,
    slices            = 50
) {
    square( [5, 45], center = true);
}

// Number 5
union() {
    translate( [275, -275, 0] )
    flames(
        180,
        scaling_start     = [0.6, 0.6, 1.0],
        scaling_end       = [0.4, 1.0, 1.0],
        x_radius          = 25,
        y_radius          = 15,
        steepness         = 0.8,
        transition        = 0.6,
        height_distortion = 0.8,
        turns = 1.3,
        slices            = 50
    ) {
        square( [5, 45], center = true);
    }
    
    translate( [275, -275, 0] )
    flames(
        180,
        scaling_start     = [0.6, 0.6, 1.0],
        scaling_end       = [0.4, 1.0, 1.0],
        x_radius          = 25,
        y_radius          = 15,
        steepness         = 0.8,
        transition        = 0.6,
        height_distortion = 0.8,
        turns = 1.3,
        slices            = 50
    ) {
        rotate( [0, 0, 45] )
        square( [5, 45], center = true);
    }
}
    