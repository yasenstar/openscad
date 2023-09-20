
// a window stopper with a rotating wedge
// (all sizes in millimeter)

module window_stopper(
    window_thickness,         // thickness of window frame
    windowsill_dist,          // distance between window and windowsill
    windowsill_adj     = 0,   // adjustment for windowsill distance
    stopper_width      = 30,  // width of the stopper
    material_thickness = 5,   // material thickness of the stopper
    window_overlap     = 7,   // overlap of stopper and window
    axle_dm            = 10,  // axle diameter
    axle_clearance     = 0.5, // axle clearance towards bushing
    wedge_start_r      = 0,   // wedge start radius
    wedge_end_r        = 11,  // wedge end radius
    wedge_angle        = 42,  // start angle of wedge
    lever_depth        = 15,  // depth of lever
    lever_length       = 40,  // length of lever
    lever_angle        = 15,  // start angle of lever
    print_version      = false  
) {

    $fn = 36;
    axle_height = 
        material_thickness + (windowsill_dist - material_thickness) / 2;

    module window() {
        color("LightSkyBlue")
        translate( [-20, -window_thickness / 2, windowsill_dist] )
        cube( [100, window_thickness, 0.1] );
    }

    module stopper_case() {
    	case_size = [
    		stopper_width,                              
    		window_thickness + 2 * material_thickness,  
    		windowsill_dist + window_overlap    
    	];
        
        translate( [0, -case_size.y / 2, 0] ) 
        difference() {
            cube( case_size );
            
            translate( [-1, material_thickness, material_thickness] )
            cube( [case_size.x + 2, window_thickness, case_size.z] );
            
            axle_bushing = axle_dm + axle_clearance;
            
            translate( [case_size.x / 2, -1, axle_height] )
            rotate( [-90, 0, 0] )
            cylinder( d = axle_bushing, h = case_size.y + 2);
            
            translate( [(case_size.x - axle_bushing) / 2, -1, axle_height] )
            cube( [axle_bushing, case_size.y + 2, case_size.z] );
        }
        
        translate( [0, -case_size.y / 2, -windowsill_adj] )
        cube( [case_size.x, case_size.y, windowsill_adj] );
    }

    module stopper( angle = 0 ) {
        axle_length = window_thickness + 2 * material_thickness + 2;
        
        translate( [stopper_width / 2, -axle_length / 2, axle_height] )
        rotate( [-90, 0, 0] )
        cylinder( d = axle_dm, h = axle_length );
        
        points = [
            for (i = [0:5:360]) 
            let (radius = wedge_start_r + (wedge_end_r - wedge_start_r) * i / 360 ) 
            [ cos( i ) * radius, sin( i ) * radius ] 
        ];

        wedge_width = window_thickness - 2;
        
        translate( [stopper_width / 2, -wedge_width / 2, axle_height] )
        rotate( [-90, 0, 0] ) 
        rotate( [0, 0, wedge_angle + angle] )
        linear_extrude( height = wedge_width )  
        polygon(points);
            
        translate( [stopper_width / 2, -axle_length / 2 + 0.1, axle_height] )
        rotate( [0, lever_angle + angle, 0] )
        rotate( [90, 0, 0] )
        linear_extrude( height = lever_depth )
        hull() {
            circle( d = axle_dm );
            translate( [lever_length - axle_dm / 2 - axle_dm / 3, 0, 0] )
            circle( d = axle_dm * 0.66 );
        }        
    }
    
    if (print_version) {
        stopper_case();
        
        translate([
            stopper_width, 
            0, 
            (window_thickness + 2 * material_thickness + 2) / 2 + 
                lever_depth - 0.1
        ])
        rotate( [90, 0, 0] )
        stopper();
    } else {
        window();    
        stopper_case();    
        stopper( - 100);
    }

}

window_stopper(
    window_thickness = 18, 
    windowsill_dist  = 20,
    print_version    = true
);

