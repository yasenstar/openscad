module clock_movement() {
    
    // box-shaped main body
    width = 56;
    depth = 56;
    height = 20;
    
    // alignment pattern
    alignment_dm = 14; // diameter of alignment pattern
    alignment_h = 1;    // height of alignment pattern
    alignment_flat = 1; // recess of falttening
    alignment_notch_dm = 6; // diameter of alignment notches
    alignment_notch_fl = 2; // recess of notch flattening
    
    // main body
    color("Gray")
    // method 1 as of in the book
    translate( [-width / 2, -depth / 2 , -height ] )
    cube( [width, depth, height] ); 
    // method 2
//    translate( [0, 0, -height/2] )
//   # cube( [width, depth, height], center = true ); 
    
    // alignment pattern
    difference() {
        
        color("DarkBlue")
        cylinder( d = alignment_dm, h = alignment_h, $fn = 36);
        
        color("Gray")
        for ( i = [0:1] )
        mirror( [i, 0, 0] )
        union() {
            translate([ alignment_dm / 2 - alignment_flat, -(alignment_dm + 2) / 2, -1 ])
            cube([alignment_flat + 1, alignment_dm + 2, alignment_h + 2 ]);
            
            translate([ alignment_dm / 2 - alignment_notch_fl + alignment_notch_dm / 2, 0, -1 ])
            cylinder( d = alignment_notch_dm, h = alignment_h +2, $fn = 18);
        }
    }
    
    }
    
clock_movement();