use <self/vehicle_parts.scad>
$fn=100;

module axle_wheelset(track=35, radius=2) {
    translate([0,track/2,0])
        children(0);
    axle(track=track, radius=radius);
    translate([0,-track/2,0])
        children(1);
}

axle_wheelset() {
    simple_wheel();
    complex_wheel();
}