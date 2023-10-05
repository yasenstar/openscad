module r_tree(
    h_increment,
    main_depth,
) {
    linear_extrude( height = h_increment )
    children(0);
    
    if (main_depth > 0) {
        
        translate( [ 0, 0, h_increment] )
         r_tree(
            h_increment,
            main_depth - 1
            ) {
                children(0);
            }
    }
}

r_tree(
    h_increment = 10,
    main_depth = 20
) {
    circle( d= 10, $fn = 8);
}