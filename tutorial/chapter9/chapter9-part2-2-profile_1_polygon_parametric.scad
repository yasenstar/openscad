// Approach 1 -- recommended more

// Given dimensions
d1 = 15;
d2 = 30;
h1 = 20;
h2 = 40;

// Points
p0 = [0,0];
p1 = [0,h1+h2];
p2 = [d1,h1+h2];
p3 = [d1+d2,h1];
p4 = [d1+d2,0];

points = [p0, p1, p2, p3, p4];

echo(points);

polygon(points);
