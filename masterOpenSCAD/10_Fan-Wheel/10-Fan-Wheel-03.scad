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
        
        width = outer_width / 2 - inner_width / 2;
        
        depth = 
            sqrt(
                pow( ( outer_width / 2 * cos( abs ( twist ) ) ) -
                        ( inner_width / 2 ), 2 ) +
                pow (blade_height, 2 )
            ) + thickness;
        
        height = sin ( abs ( twist ) ) * outer_width / 2 + thickness;
        
        angle = 
            atan(
                    ( ( outer_width / 2 * cos( abs ( twist ) ) ) -
                        ( inner_width / 2 )
                    ) / blade_height
            );
        
        difference() {
        
            translate( [ 0, inner_height, 0 ])
            rotate( [-90, 0, 0 ] )
            linear_extrude(
                height = blade_height,
                twist = twist,
                slices = 10,
                convexity = 10
            )
            square( [outer_width, thickness], center = true);
            
            for ( i = [0 : 1])
            mirror( [i, 0, 0] )
            translate( [ inner_width / 2, inner_height, -height ] )
            rotate( [ 0, 0, -angle] )
            translate( [ 0, -depth / 2, 0 ] )
            cube( [ width * 2, depth * 1.5, 2 * height] );
        }
        
    }
    
    blade(); // debug
}

fan_wheel();