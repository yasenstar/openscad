// a window stopper with rotating wedge
// (all sizes in millimeter)

module window_stopper(

    /* parameters */
    
) {
    
    $fn = 10;
    
    module window() {}
    
    module stopper_case() {}
    
    module stopper() {}
    
    window();
    stopper_case();
    stopper();
    
}

window_stopper( /* parameters */ );