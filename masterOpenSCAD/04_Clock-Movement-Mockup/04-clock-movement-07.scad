module clock_movement( time = [1, 39, 15], hand_style = "deco") {
    
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

    // screw terminal (measured from main body)
    screw_terminal_dm = 7.8;    // screw terminal diameter
    screw_terminal_h = 5;   // screw terminal height
    
    // clock hands axle
    hour_axle_dm = 5.1; // hour axle diameter
    hour_axle_h = 8.3;  // hour axle height
    
    minute_axle_dm = 3.2; // hour axle diameter
    minute_axle_h = 12.1;  // hour axle height
    
    second_axle_dm = 1; // hour axle diameter
    second_axle_h = 14.5;  // hour axle height
    
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
    
    // screw terminal
    color("Gold")
    cylinder( d = screw_terminal_dm, h = screw_terminal_h, $fn = 36);
    
    // axles
    color("Black") {
        cylinder( d = hour_axle_dm, h = hour_axle_h, $fn = 36);
        cylinder( d = minute_axle_dm, h = minute_axle_h, $fn = 36);
        cylinder( d = second_axle_dm, h = second_axle_h, $fn = 36);
    }
    
    // clock hands
    rotate( [0, 0, -360 *  time[0] / 12] )
    translate( [0, 0, hour_axle_h - 1] )
    hour_hand();
    
    rotate( [0, 0, -360 * time[1] / 60] )
    translate( [0, 0, minute_axle_h - 1] )
    minute_hand();
    
    rotate( [0, 0, -360 * time[2] / 60] )
    translate( [0, 0, second_axle_h ] )
    second_hand();
    
    module hour_hand()  // German: stundenzeiger
    {
        
        h = 0.4;   // height
        l = 72.35; // length
        r = 67.6;  // radius
        b = 5;     // width
        dm = 9.5;  // diameter
        
        if (hand_style == "modern") {
            color("Black")
            union() {
                cylinder( d = dm, h = h, $fn = 36);
                
                translate( [ -b / 2,  0, 0 ] )
                    cube ( [ b, r, h] );
                }
            }
            
        if (hand_style == "deco") {
            color("black")
            linear_extrude( height = h )
            import("hour.svg");
            }
        }
    
    module minute_hand()    // German: minute hand
        {
        
        h  = 0.4;   // height
        l  = 100.5; // length
        r  = 96;    // radius
        b  = 4;     // width
        dm = 9;     // diameter
        
        if (hand_style == "modern") {
            color("Black")
            union() {
                cylinder( d = dm, h = h, $fn = 36 );
                
                translate( [-b / 2, 0, 0] )
                cube( [b, r, h] );
            }
        }
        
        if (hand_style == "deco") {
            color("black")
            linear_extrude( height = h )
            import("minute.svg");
            }
    }
    
    module second_hand()    // German: sekundenzeiger
    {
        
        b1  = 1.25; // width front part
        l1  = 95;   // length front part
        b2  = 1.25; // width neck
        l2  = 15;   // length neck
        b3  = 4.6;  // width back part
        l3  = 24;   // length back part
        dm  = 7.1;  // diameter
        h   = 0.4;  // material thickness
        
        if (hand_style == "modern") {
            color("Red")
            union() {
                cylinder( d = dm, h = h, $fn = 36);
                
                translate( [-b1 / 2, 0, 0] )
                cube( [b1, l1, h] );
                
                translate( [-b2 / 2, -l2, 0] )
                cube( [b2, l2, h] );

                translate( [-b3 / 2, -(l2 + l3), 0] )
                cube( [b3, l3, h] );
            }
        }
        
        if (hand_style == "deco") {
            color("red")        // project file is still "black"
            linear_extrude( height = h )
            import("second.svg");
            }
       
        }
    
    }
    
clock_movement();