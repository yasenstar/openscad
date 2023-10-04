// Program: Flame Sculpture

module flames (
    height,
    scaling_start     = [1.0, 1.0, 1.0],
    scaling_end       = [0.1, 0.1, 0.1],
    x_radius          = 15,
    y_radius          = 10,
    steepness         = 0.2,
    transition        = 0.35,
    height_distortion = 0.7,
    turns             = 1,
    slices            = 30
) {}

flames(180) {
    circle( d = 60, $fn = 30);
    sphere (d = 60);
}