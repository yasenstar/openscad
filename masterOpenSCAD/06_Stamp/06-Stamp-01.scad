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
        
        color("Peru")
            relief();
}

stamp("OpenSCAD", 10);