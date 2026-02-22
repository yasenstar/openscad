// $fn=100;

for (m = [0:10:170]) {
    rotate([0,0,m])
    for (n = [0:10:350]) {
        rotate([n,0,0])
        cylinder(10,0,.5);
        };
}
    
color([0,0.5,0.5],0.3)
    sphere(10);

