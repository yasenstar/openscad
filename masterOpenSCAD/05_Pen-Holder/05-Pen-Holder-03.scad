arch_width  = 50;
arch_base = 5;
arch_angle = 70;
arch_radius = arch_width / (2 - 2 * cos(arch_angle) );

for (m = [0:1] )
mirror( [m, 0, 0] )
translate( [cos(arch_angle) * arch_radius, 0, 0] )
rotate( [-90, 0, 0] )
rotate_extrude( angle = arch_angle, $fn = 100)
translate( [ -arch_radius, 0 ] )
union() {
    translate( [0, -arch_base / 2] )
        square( arch_base );

    translate( [arch_base, 0])
        circle( d = arch_base * 3 / 5, $fn=28);
    }