module stamp(
    txt = "OpenSCAD",        // Stamp text
    font_size = 10,     // approx. height of Letter
    font = "Liberation Sans:stype=Bold Italic",
//    font = "MS Gothic:stype=Regular",
    stamp_depth =2,     // depth of the stamp relief
) {

    module relief() {
        linear_extrude( height = stamp_depth )
        text(
            text = txt,
            size = font_size,
            font = font,
            valign = "center",
            halign = "center",
            $fn = 50
            );
        }
        
    module stamp_body() {
    }
    
    color("Peru")
        relief();
        
    stamp_body();
    
    module text_area() {
        
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
        
        
    
   ! text_area(); // debug

}

stamp("OpenSCAD", 10);