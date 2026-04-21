// Chaikin smoothing functions
function chaikin_iter(pts) = [
    for (i = [0:len(pts)-2]) 
        each [
            pts[i] * 0.75 + pts[i+1] * 0.25,
            pts[i] * 0.25 + pts[i+1] * 0.75
        ]
];

function chaikin(pts, n=2) = 
    n == 0 ? pts : chaikin(chaikin_iter(pts), n-1);

// Raw control points
raw_points = [
    [0.0, 3.8],
    [0.0, 3.8],     // pin nose tip
    [1.0, 4.9],  
    [2.5, 6.2],
    [5.0, 7.8],
    [8.0, 9.2], 
    [10.5, 10.0],
    [13.0, 10.5],  
    [17.0, 10.8],   // apex
    [35.0, 11.0],   
    [47.0, 11.0],
    [47.0, 11.0],   // pin tail upper corner
    [47.0,  7.7],
    [47.0,  7.7],   // pin tail lower corner
    [35.0, 6.5],   
    [32.0, 6.0],
    [29.0, 5.5],
    [26.5, 5.0],
    [22.0, 3.7],
    [19.5, 2.5],
    [18.0, 1.5],
    [17.0, 0.0], 
    [12.0, 0.25],
    [9.0,  0.5],
    [6.0,  0.95],   
    [3.5,  1.5],
    [2.0,  2.0],   
    [1.0,  2.5],  
    [0.5,  3.0],
    [0.0,  3.8],
    [0.0,  3.8],    // pin closing nose tip
];

smooth_points = chaikin(raw_points, 2);

scale_factor = 4;

module fuse_profile_1() {
scale([scale_factor, scale_factor, 1])
    polygon(points = smooth_points);
}
