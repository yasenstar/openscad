module clock_movement( time = [4, 39, 15], hand_style = "deco") {
    
        // clock_movement constants
    movement_data = [
        ["width",  56], // width of the main body
        ["depth",  56], // depth of the main body
        ["height", 20], // height of the main body

        ["alignment_dm",       14], // alignment diameter
        ["alignment_h",         1], // alignment height
        ["alignment_flat",      1], // alignment flattening
        ["alignment_notch_dm",  6], // alignment notch diameter
        ["alignment_notch_fl",  2], // alignment notch flattening
        
        ["screw_terminal_dm", 7.8], // screw terminal diameter
        ["screw_terminal_h",  5  ], // screw terminal height
                                   // measured from main body
        
        ["hour_axle_dm", 5.1], // hour axle diameter
        ["hour_axle_h",  8.3], // hour axle height
        
        ["minute_axle_dm",  3.2], // minute axle diameter
        ["minute_axle_h",  12.1], // minute axle height

        ["second_axle_dm",  1  ], // second axle diameter
        ["second_axle_h",  14.5]  // second axle height
    ];

    function movement_dim( name ) = 
        [ for (d = movement_data) if (d[0] == name) d[1] ][0];
    
    width  = movement_dim("width");
    depth  = movement_dim("depth");
    height = movement_dim("height");
       
    alignment_dm       = movement_dim("alignment_dm");
    alignment_h        = movement_dim("alignment_h");
    alignment_flat     = movement_dim("alignment_flat");
    alignment_notch_dm = movement_dim("alignment_notch_dm");
    alignment_notch_fl = movement_dim("alignment_notch_fl");
    
    screw_terminal_dm = movement_dim("screw_terminal_dm");
    screw_terminal_h  = movement_dim("screw_terminal_h");
    
    hour_axle_dm = movement_dim("hour_axle_dm");
    hour_axle_h  = movement_dim("hour_axle_h");
    
    minute_axle_dm = movement_dim("minute_axle_dm");
    minute_axle_h  = movement_dim("minute_axle_h");

    second_axle_dm = movement_dim("second_axle_dm");
    second_axle_h  = movement_dim("second_axle_h");
        

    
    // hand_style constants
    hands_data = [
        ["style",    "modern", "classic", "deco"],

        ["hour_l",      72.35,        61,   62.9],
        ["hour_r",       67.6,      56.6,  58.65],
        ["hour_w",          5,       1.5,      2],
        ["hour_h",        0.4,       0.4,    0.4],

        ["minute_l",    100.5,        84,  101.5],
        ["minute_r",       96,      79.5,  74.62],
        ["minute_w",        4,         1,      1],
        ["minute_h",      0.4,       0.4,    0.4],

        ["second_l",      134,       123,    120],
        ["second_r",       95,      88.4,  85.66],
        ["second_w",     1.25,       0.6,    0.7],
        ["second_h",      0.4,       0.4,    0.4]
    ];

    function hands_dim( name, stil ) = 
        let ( 
            row = search( [name], hands_data)[0],
            col = search( [stil], hands_data[0])[0]
        ) hands_data[row][col];
    
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
        h = hands_dim("hour_h",hand_style);
        l = hands_dim("hour_l",hand_style);
        r = hands_dim("hour_r",hand_style);
        b = hands_dim("hour_w",hand_style);
        
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
        
        if (hand_style == "classic") {
            lc = 61;
            color("black")
            png_hands( "hour.png", lc, h, [-9.5, -6.75, 0]);
            }
            
        }
    
    module minute_hand()    // German: minute hand
        {
        
        h = hands_dim("minute_h",hand_style);
        l = hands_dim("minute_l",hand_style);
        r = hands_dim("minute_r",hand_style);
        b = hands_dim("minute_w",hand_style);
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
            
        if (hand_style == "classic") {
            lc = 84;

            color("Black")
            png_hands("minute.png", lc, h, [-9, -6.75, 0]);
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
        h = hands_dim("second_h",hand_style);
        l = hands_dim("second_l",hand_style);
        r = hands_dim("second_r",hand_style);
        b = hands_dim("second_w",hand_style);
        
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
        
        if (hand_style == "classic") {
            lc = 123;

            color("Black")
            png_hands("second.png", lc, h, [-4,-36.8,0] );
        }
       
        }
        
        module png_hands(filename, length, height, displacement) {
            translate( displacement )
            linear_extrude( height = height )
            resize( [0, length], auto = true )
            projection( cut = true )
            translate( [0, 0, 75])
            surface( filename, invert=true);
            }
    
    }
 
function get_time (tick) = [ (tick / 3600) % 12, (tick / 60 ) % 60, tick % 60];
 
clock_movement( get_time($t * 43200), "modern");