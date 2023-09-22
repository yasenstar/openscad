module arch(
    arch_width  = 50,
    arch_base = 5,
    arch_angle = 65,
    pillar_height = 50,) {
        
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
    union() {
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
    
arch();