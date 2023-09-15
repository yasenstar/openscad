// Heart

// x: 16 * pow(sin(t), 3)
// y: 13 * cos(t) - 5 * cos(2*t) - 2 * cos(3*t) - cos(4*t)

function heart_coordinates(t) = [16 * pow(sin(t), 3), 13 * cos(t) - 5 * cos(2*t) - 2 * cos(3*t) - cos(4*t)];

n = 100;
step = 360/n;
h = 20;

function heart_points(n=50) = [ for (t=[0:step:359.999]) heart_coordinates(t) ]; 

module heart(h=10, n=50) {
points = heart_points(n=n);
    
linear_extrude(height=h)
    polygon(points);
}

heart(h=20);