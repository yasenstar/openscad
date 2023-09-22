module clock_movement() {
    
    // box-shaped main body
    width = 56;
    depth = 56;
    height = 20;
    
    // main body
    color("Gray")
//    translate( [-width / 2, -depth / 2, -height] )
    cube( [width, depth, height], center = true ); // tutorial is not in center (?)
    
    }
    
clock_movement();