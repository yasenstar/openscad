module stamp(
    txt = "OpenSCAD",        // Stamp text
    font_size = 10,     // approx. height of Letter
    font = "Liberation Sans:stype=Bold Italic",
//    font = "MS Gothic:stype=Regular",
    stamp_depth =2,     // depth of the stamp relief
    stamp_margin = 5,       // margin of the text
    stamp_relief_depth = 2,     // depth of the relief substrate
    
    border = true, // enable text border
    border_thickness = 2,       // text border thickness
    border_radius = 2,      // text border radius
    
    stamp_relief   = true,     // generate stamp relief
    stamp_body     = true,     // generate stamp body

    body_height    = 10,       // stamp body height
    body_base      = 2,        // height of stamp body base
    body_border    = 1.6,      // wall thickness of relief mount
    body_allowance = 0.5,      // expansion of relief mount when printing in 
                               // two parts
    body_inner_depth   = 1,    // depth of relief mount
    body_radius        = 1,    // stamp body edge radius
    body_taper         = 3,    // stamp body taper
    body_handle_dm     = 25,   // handle sphere diameter
    body_handle_height = 40,   // handle sphere height above body
    body_handle_collar = 3,    // lower handle collar
    body_handle_ind    = 5     // diameter of the front indicator
) {

    module relief() {
        // text
        linear_extrude( height = stamp_depth )
        text(
            text = txt,
            size = font_size,
            font = font,
            valign = "center",
            halign = "center",
            $fn = 50
            );
            
        // relief base
        translate([0,0,stamp_depth])
        linear_extrude( height = stamp_relief_depth )
        offset( delta = stamp_margin + (border ? border_thickness : 0))
        text_area();
        
        // border
        if (border) {
        linear_extrude( height = stamp_depth )
        difference() {
            minkowski() {
                offset( delta = stamp_margin - border_radius + ((border_radius > 0) ? 0 : border_thickness) )
               text_area();
                
               if (border_radius > 0)
                    circle( r = border_radius + border_thickness, $fn = 36);
            }
           
            minkowski() {
                offset( delta = stamp_margin - border_radius )
               text_area();
                
                if (border_radius > 0)
                    circle( r = border_radius, $fn = 36);
                }
           }
       }
    }
        
    module stamp_body() {
    
        body_z_null = stamp_depth + stamp_relief_depth - body_inner_depth;
        
       module base( taper = 0 ) {
            minkowski() {
                offset(
                    delta = stamp_margin + 
                            (border ? border_thickness : 0) + 
                            body_border +                     
                            (stamp_relief ? 0 : body_allowance) -
                            body_radius - 
                            body_taper
                ) 
                text_area();
  
                if (body_radius > 0)
                circle( r = body_radius, $fn = 36);
                }
            }
            
        // main body
        difference() {
            hull() {
                translate([
                        0,
                        0,
                        body_z_null
                    ])
                    linear_extrude( height = body_base )
                    base();
                
                translate([
                        0,
                        0,
                        body_z_null + body_height
                    ])
                linear_extrude( height = 0.01 )
                base( body_taper);
            }
            
            translate( [0, 0, stamp_depth] )
            linear_extrude( height = stamp_relief_depth)
            offset(
                delta = stamp_margin + 
                        (border ? border_thickness : 0) + 
                        (stamp_relief ? 0 : body_allowance)
            ) 
            text_area();
      
        }
        
        // handle sphere
        translate( [0, 0, body_z_null + body_height + body_handle_height])
        sphere(d = body_handle_dm, $fn = 50);
        
        // handle front indicator
       color("Silver")
        translate([
            0, 
            body_handle_dm / 2, 
            body_z_null + body_height + body_handle_height
        ])
        scale( [1, 0.5, 1] )
        sphere(d = body_handle_ind, $fn = 25);
        
        // handle neck
        
       translate( [0, 0, body_z_null + body_height])
        rotate_extrude( $fn = 50 )
        difference(){
            square( 
                [body_handle_dm / 2 - body_handle_collar, body_handle_height] 
            ); 
            
            translate([body_handle_dm / 2, body_handle_height / 2 ])
            scale( [0.4, 1] )
            circle( d = body_handle_height, $fn = 50 );
            }
        
    }
    
    color("Peru")
        relief();
        
    stamp_body();
    
    module text_area() {
    
        estimated_length = len(txt) * font_size * 2;
        
        projection()
        intersection() {
           translate( [0,0,-1] )
            rotate([-90,0,0])
            translate([0,0,-(3 * font_size) / 2])
            linear_extrude( height = 3 * font_size)
            hull()
            projection()
            rotate([90,0,0])
            linear_extrude( height = 3 )
            text(
                    text = txt,
                    size = font_size,
                    font = font,
                    valign = "center",
                    halign = "center",
                    $fn = 50
                    );
            
            rotate( [0, -90, 0] )
            translate( [ 0, 0, -estimated_length / 2] )
            linear_extrude( height = estimated_length)
            hull()
            projection()
            rotate([0,90,0])
            linear_extrude( height = 1 )        
            text(
                    text = txt,
                    size = font_size,
                    font = font,
                    valign = "center",
                    halign = "center",
                    $fn = 50
                    );
                }
        }
    
    if (stamp_relief) {
        color("Peru")
        rotate([0, stamp_body ? 0 : 180, 0])            
        relief();
    }
    
    if (stamp_body) {        
        stamp_body();
    }

}

st  = "OpenSCAD";
stg = 10;

stamp(st,stg);