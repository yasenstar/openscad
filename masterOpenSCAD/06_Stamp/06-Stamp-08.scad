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
     offset( delta = stamp_margin - border_radius )
       text_area();
        
       circle( r = border_radius + border_thickness, $fn = 36);
       }
       
     minkowski() {
     offset( delta = stamp_margin - border_radius )
       text_area();
        
       circle( r = border_radius, $fn = 36);
       }
       }
       }
    }
        
    module stamp_body() {
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
    


}

stamp("OpenSCAD", 10);