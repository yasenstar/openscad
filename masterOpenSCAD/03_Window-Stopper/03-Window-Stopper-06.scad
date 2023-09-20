// a window stopper with rotating wedge
// (all sizes in millimeter)

module window_stopper(

    /* parameters */
    
    // for window
    window_thickness = 10,   // thickness of window frame
    windowsill_dist = 10,        // distance between window and windowsill
    // for window_stopper
    windowsill_adj = 1,     // adjustment for windowsill distance
    stopper_width = 30,     // width of the stopper
    material_thickness = 5,     // material thickness of the stopper
    window_overlap = 7,     // overlap of stopper and window
    axle_dm = 10,       // axle diameter
    axle_clearance = 0.5,       // axle clearance towards bushing
    // for stopper
    wedge_start_r = 0,      // wedge start radius
    wedge_end_r = 11,      // wedge end radius
    wedge_angle = 42,       // start angle of wedge
    lever_depth = 15,       // depth of lever
    lever_length = 40,      // length of lever
    lever_angle = 15,       // start angle of lever
    
) {
    
    $fn = 10;
    
    axle_height =
        material_thickness + (windowsill_dist - material_thickness) / 2;
    
    module window() {
        color("LightSkyBlue")
            translate( [ -20, -window_thickness / 2, windowsill_dist])
                cube( [100, window_thickness, 0.1]);
        }
    
    module stopper_case() {
        case_size = [
            stopper_width,
            window_thickness + material_thickness * 2,
            windowsill_dist + window_overlap
        ];
        
        translate( [0, -case_size.y / 2, 0] )
        difference() {
            cube( case_size );
            axle_bushing = axle_dm + axle_clearance;
            
            translate( [-1, material_thickness, material_thickness] )
                cube( [case_size.x + 2, window_thickness, case_size.z] );
            
            translate( [case_size.x / 2, -1, axle_height] )
                rotate( [-90,0.0])
                    cylinder( d = axle_bushing, h = case_size.y + 2);
            
            translate( [(case_size.x - axle_bushing) / 2, -1, axle_height] )
                cube( [axle_bushing, case_size.y + 2, case_size.z] );
        }
        
        translate( [0, -case_size.y / 2, -windowsill_adj] )
            cube( [case_size.x, case_size.y, windowsill_adj] );
        
        }
    
    module stopper( angle = 0 ) {
        axle_length = window_thickness + material_thickness * 2 + 2;
        
        translate( [stopper_width / 2, -axle_length / 2, axle_height] )
            rotate( [ -90, 0, 0] )
                cylinder( d = axle_dm, h = axle_length );
        
        points = [
            for ( i = [0:5:360] )
                let ( radius = wedge_start_r + (wedge_end_r - wedge_start_r) * i / 360 )
            [ cos(i) * radius, sin(i) * radius ]
        ];
        
//        points = [
//            for ( i = [0:5:360] )
//            [ cos(i) * (wedge_start_r + (wedge_end_r - wedge_start_r) * i / 360), sin(i) * (wedge_start_r + (wedge_end_r - wedge_start_r) * i / 360) ]
//        ];
            
        wedge_width = window_thickness - 2;
            
//            echo(points);
       translate( [stopper_width / 2, -wedge_width / 2, axle_height] )
            rotate( [-90, 0, 0] )
            rotate( [0, 0, wedge_angle + angle] )
            linear_extrude( height = wedge_width )
            polygon(points);
            
        translate( [stopper_width / 2, -axle_length / 2 + 0.1, axle_height] )
            rotate( [0, lever_angle + angle, 0] )
            rotate( [90,0,0])
            linear_extrude( height = lever_depth )
            hull() {
            circle ( d = axle_dm );
            translate( [lever_length - axle_dm / 2 - axle_dm / 3, 0, 0] )
               circle( d = axle_dm * 0.66);
        }
            
        }
    
    window();
    stopper_case();
    stopper();
    
}

window_stopper( /* parameters */ );