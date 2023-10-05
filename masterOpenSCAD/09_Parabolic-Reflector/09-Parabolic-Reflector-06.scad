/*
    parabola module
    
    - focus_point,    focus point as 3D-vector
    - base_area,      dimension of the base are as 2D-vector
    - resolution,     number of grid points as 2D-vector
*/

module parabola( focus_point, base_area, resolution = [10, 10] ) {

    function parabola_point( focus_point, base_point) =
        let ( dist_fb = norm(focus_point - base_point) )
        [
            base_point.x,
            base_point.y,
            ( dist_fb * dist_fb ) / ( 2 * (focus_point.z - base_point.z))
        ];
    
    parabola_points = [
        for (
            y = [0 : base_area.y / resolution.y : base_area.y + 0.1],
            x = [0 : base_area.x / resolution.x : base_area.x + 0.1]
        )
        parabola_point( focus_point, [x,y,0] )
    ];
    
    base_points = [
        for (
            y = [0 : base_area.y / resolution.y : base_area.y + 0.1],
            x = [0 : base_area.x / resolution.x : base_area.x + 0.1]
        )
        [x, y, 0]
    ];
    
    size_x = resolution.x + 1;
    
    parabola_faces = [
        for (
            y = [0 : resolution.y - 1],
            x = [0 : resolution.x - 1]
        )
        [
            y * size_x + x,
            y * size_x + x + 1,
            (y+1) * size_x + x +1,
            (y+1) * size_x + x
        ]
    ];
    
    size_ppoints = len( parabola_points );
    
    base_faces = [
        for (
            y = [0 : resolution.y - 1],
            x = [0 : resolution.x - 1]
        )
        [
            y * size_x + x + size_ppoints,
            y * size_x + x + 1 + size_ppoints,
            (y+1) * size_x + x +1 + size_ppoints,
            (y+1) * size_x + x + size_ppoints
        ]
    ];
    
    side_faces_1 = [
        for ( x = [0 : resolution.x - 1] )
        [
            x,
            x + 1,
            x + 1 + size_ppoints,
            x + size_ppoints
        ]
    ];
    
}

parabola(
    focus_point = [75, 75, 100],
    base_area = [150, 150],
);

// ==========================================

// Mathematic Background

/// distance between f and b
//dist_fb = norm(f - b)
//
//cos(a) = (f.z - b.z) / dist_fb
//
//cos(a) = (dist_fb / 2) / p.z
//
//(f.z - b.z) / dist_fb = (dist_fb / 2) / p.z
//
//// both sides times p.z
//
//p.z * (f.z - b.z) / dist_fb = dist_fb / 2
//
//
//// both sides divided by ((f.z - b.z) / dist_fb)
//
//p.z = (dist_fb / 2) / ((f.z - b.z) / dist_fb)
//
//
//// replace outer division by multiplikation with the inverse
//
//p.z = (dist_fb / 2) * (dist_fb / (f.z - b.z))
//
//
//// multiply out: numerator times numerator, denominator times denominator
//
//p.z = (dist_fb * dist_fb) / (2 * (f.z - b.z))