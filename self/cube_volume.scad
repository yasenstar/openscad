color([0,0,1], 0.5)
polyhedron(
  points=[ [0,0,0],[10,0,0],[10,10,0],[0,10,0], // the four points at base
           [0,0,10]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4] ] 
 );
 

translate([10,0,0])
//rotate([0,-90,0])
 {
     {
        color([1,0,0], 0.5)
        polyhedron(
          points=[ [0,0,0],[10,0,0],[10,10,0],[0,10,0], // the four points at base
                   [10,0,10]  ],                                 // the apex point 
          faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4] ] 
         );
    }
}
 

translate([0,10,0])
//rotate([90,0,0])
color([0,1,0],0.5)
polyhedron(
  points=[ [0,0,0],[10,0,0],[10,10,0],[0,10,0], // the four points at base
           [0,10,10]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4] ] 
 );
