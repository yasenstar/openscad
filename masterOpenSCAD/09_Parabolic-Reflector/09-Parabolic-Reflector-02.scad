function parabola_point( focus_point, base_point) =
    let ( dist_fb = norm(focus_point - base_point) )
    [
        base_point.x,
        base_point.y,
        ( dist_fb * dist_fb ) / ( 2 * (focus_point.z - base_point.z))
    ];


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