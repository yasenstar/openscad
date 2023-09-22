arch_width    = 60;
arch_base     = 5;
arch_angle    = 50;
pillar_height = 75;

module side_piece(
    arch_width,
    arch_base,
    arch_angle,
    pillar_height,
    ) 
    {

    module arch(
        arch_width,
        arch_base,
        arch_angle,
        pillar_height,) {
            
        arch_radius = arch_width / (2 - 2 * cos(arch_angle) );
        
        module basic_shape() {
            union() {
            translate( [0, -arch_base / 2] )
                square( arch_base );

            translate( [arch_base, 0])
                circle( d = arch_base * 3 / 5, $fn=28);
            }
        }

        translate( [0, 0, pillar_height] )
        for (m = [0:1] )
        mirror( [m, 0, 0] )
        difference() {

            translate( [cos(arch_angle) * arch_radius, 0, 0] )
            union() 
            {
                rotate( [-90, 0, 0])
                rotate_extrude( angle = arch_angle, $fn = 100 )
                translate( [-arch_radius, 0] )
                basic_shape();

                translate( [0, 0, -pillar_height] )
                linear_extrude( height = pillar_height )
                translate( [-arch_radius, 0] )
                basic_shape();
                    }
                    
               translate([
                    0, 
                    -arch_base, 
                    sin(arch_angle) * arch_radius - 5 * arch_base
                ])
                cube( 5 * arch_base);
            }       
        }

    width_factor = 2 / 3;
    base_factor  = 3 / 5;

    // inner arches
    displacement_x1 = 
        (arch_width -
         arch_width * width_factor - 
         arch_base / 2) / 2;

    for(v = [-1:2:1])
    translate( [displacement_x1*v, 0, 0] )
    arch(
        arch_width * width_factor,
        arch_base * base_factor,
        arch_angle * 0.82,
        pillar_height,
    );

    // inner side arches
    displacement_x2 = 
        (arch_width - 
         arch_width * (1 - width_factor) - 
         arch_base / 2) / 2;

    for(v = [-1:2:1])
    translate( [displacement_x2*v, 0, 0] )
    arch(
        arch_width * (1 - width_factor),
        arch_base * base_factor,
        arch_angle * 0.58,
        pillar_height,
    );
};

hexagonal_height = arch_width / ( 2 * tan(30) );

for (r = [0:60:359])
rotate( [0, 0, r] )
translate( [0, hexagonal_height - arch_base / 2, 0] )
side_piece(
    arch_width,
    arch_base,
    arch_angle,
    pillar_height,
);