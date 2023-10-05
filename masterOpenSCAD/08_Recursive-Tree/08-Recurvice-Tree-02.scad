module r_tree(
    h_increment,
    main_depth,
    rnd_seed,
) {

    rnd_value = rands( 0, 1, 10, rnd_seed );
    echo(rnd_value);
    
    linear_extrude( height = h_increment )
    children(0);
    
    if (main_depth > 0) {
        
        translate( [ 0, 0, h_increment] )
         r_tree(
            h_increment,
            main_depth - 1 - rnd_value[0] * 2,
            rnd_value[9] * 100
            ) {
                children(0);
            }
    }
}

r_tree(
    h_increment = 10,
    main_depth = 20,
    rnd_seed = 42,
) {
    circle( d= 10, $fn = 8);
}