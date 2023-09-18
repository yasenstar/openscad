/*
    module shelf_bracket
    
    parameters:
    - side_a    is a vector [length, hole diameter, number of holes]
    - side_b    is a vector [length, hole diameter, number of holes]
    - width     refers to the width of the bracket
    - thickness refers to the material thickness of the bracket
*/

module shelf_bracket( side_a = [50,6,1], side_b = [75,4,3], width = 35, thickness = 4 ) {
    
    module xhole_plate( size, h_dm, h_num, margin ) {
        
        difference() {
        
            cube(size);
            
            h_distance = (size.x - margin) / (h_num + 1);
            
            for (x = [1:h_num])
                translate([
                    margin + x * h_distance,
                    size.y/2,
                    -1])
                cylinder( d = h_dm, h = size.z + 2, $fn=18);
            }
        }
        
        union() {
            
            // side A
            xhole_plate(
                [side_a[0], width, thickness],
                side_a[1],
                side_a[2],
                thickness
            );
            
            // side B
            translate([thickness,0,0])
            rotate([0,-90,0])
            xhole_plate(
                [side_b[0], width, thickness],
                side_b[1],
                side_b[2],
                thickness
            );
            
            // stringer
            cube( [side_a[0], thickness, side_b[0]]);
            
            translate( [0, width - thickness, 0] )
                cube( [side_a[0], thickness, side_b[0]]);
        }
    }

//shelf_bracket(
//  side_a    = [50, 6, 1],
//  side_b    = [75, 4, 3],
//  width     = 35,
//  thickness = 4
//);
    
shelf_bracket();