module fan_wheel(
    outer_radius = 55,
    inner_radius = 15,
    blade_count = 8,
    outer_width = 50,
    inner_width = 20,
    thickness = 2,
    twist = -30,
    angle_of_attack = 45,
) {
    
    module blade() {
        
        inner_height = cos( asin( inner_width / ( 2 * inner_radius ) )) * inner_radius;
        
        blade_height = outer_radius - inner_radius;
        
        translate( [ 0, inner_height, 0 ])
        rotate( [-90, 0, 0 ] )
        linear_extrude(
            height = blade_height,
            twist = twist,
            slices = 10,
            convexity = 10
        )
        square( [outer_width, thickness], center = true);
    }
    
    blade(); // debug
}

fan_wheel();