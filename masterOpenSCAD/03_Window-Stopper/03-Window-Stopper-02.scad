// a window stopper with rotating wedge
// (all sizes in millimeter)

module window_stopper(

    /* parameters */
    
    window_thickness = 10,   // thickness of window frame
    windowsill_dist = 20,        // distance between window and windowsill
    
) {
    
    $fn = 10;
    
    module window() {
        color("LightSkyBlue")
        translate( [ -20, -window_thickness / 2, windowsill_dist])
            cube( [100, window_thickness, 0.1]);
        }
    
    module stopper_case() {}
    
    module stopper() {}
    
    window();
    stopper_case();
    stopper();
    
}

window_stopper( /* parameters */ );