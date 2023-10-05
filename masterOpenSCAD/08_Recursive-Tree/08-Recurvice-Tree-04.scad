module r_tree(
    h_increment,
    md_init,
    main_depth,
    rnd_seed,
    scaling,
    s_variance,
    bd_init,
    branch_depth,
    branch_angle,
) {

    rnd_values = rands( 0, 1, 10, rnd_seed );
    // echo(rnd_value);
    
    function z(from, to, idx) = rnd_values[idx] * (to - from) + from;
    
    sf = scaling + z(-1, 1, 1) * s_variance;
    
    linear_extrude( height = h_increment, scale = sf  )
    children(0);
    
    // should we branch?
    if (
        (branch_depth > 0) &&
        (z(0, 0.8, 2) < ((md_init - main_depth) / md_init) )
    ) {
        r_angle = z(0, 720, 5); // use rnd_seed is 5 instead of 3
        br_angle = branch_angle / 2 + z(0, 0.5, 4) * branch_angle;
        
        translate( [0, 0, h_increment] )
        rotate( [ 0, 0, r_angle] )
        rotate( [br_angle, 0, 0] )
        r_tree(
            h_increment,
            md_init,
            main_depth,
            z(0,100,5),
            scaling,
            s_variance,
            bd_init,
            branch_depth - 1,
            branch_angle,
            ) {
                scale( [sf, sf] )
                children(0);
            }
        
    }
    
    if (main_depth > 0) {
        
        translate( [ 0, 0, h_increment] )
         r_tree(
            h_increment,
            md_init,
            main_depth - 1 - z(0, 2, 0),
            z(0,100,9),
            scaling,
            s_variance,
            bd_init,
            branch_depth,
            branch_angle,
            ) {
                scale( [sf, sf] )
                children(0);
            }
    }
}

r_tree(
    h_increment = 10,
    md_init = 20,
    main_depth = 20,
    rnd_seed = 42,
    scaling = 0.97,
    s_variance = 0.1,
    bd_init = 1,
    branch_depth = 3,
    branch_angle = 30,
) {
    circle( d= 10, $fn = 8);
}