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
    
    // a single flame
    module flame() {
    
        for ( i = [0:slices])
            translate( positions[i] )
            linear_extrude( height = 2 )
            scale(
                scaling_start * s_factors[i] + scaling_end * (1.0 - s_factors[i])
            )
            children(0);
    }
    
    flame() children(0); // debug
}

flames(180) {
    circle( d = 60, $fn = 30);
   sphere (d = 60);
}