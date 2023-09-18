// dimensions in millimeter [width, depth, height]
plate = [100, 50, 5];

hole_dm = 6;
hole_margin = 4;

cube(plate);

translate([
    hole_margin + hole_dm / 2,
    hole_margin + hole_dm / 2,
    0
])
color( "red" )
cylinder( h = plate.z, d = hole_dm);

//echo(plate.x, plate.y, plate.z);
//echo(plate[0], plate[1], plate[2]);