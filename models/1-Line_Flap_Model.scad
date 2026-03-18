size = 225;
text = "Zgierz";

function arc(cx, cy, r, start, end, segs=16) =
    [for(i = [0 : segs]) 
        [cx + r * cos(start + (end - start) * i / segs),
         cy + r * sin(start + (end - start) * i / segs)]
    ];

points2D = concat(
    [[2.5,0.1],
     [2.5+size,0.1],
     [2.5+size,1.1],
     [4.5+size,1.1],
     [4.5+size,2.6],
     [2.5+size,2.6],
     [2.5+size,14.6],
     [5+size,14.6]],
    arc(2+size, 31.1, 3, 0, 90, 50),
    arc(3, 31.1, 3, 90, 180, 50),
    [[0,14.6],
     [2.5,14.6],
     [2.5,2.6],
     [0.5,2.6],
     [0.5,1.1],
     [2.5,1.1],
     [2.5,0.1]]
);

linear_extrude(height = 0.2)
    polygon(points = points2D);

mirror([0, 1, 0])
    linear_extrude(height = 0.2)
        polygon(points = points2D);

difference() {
    translate([10, -15, 0.2]) {
        linear_extrude(height = 0.2)
        text(text, font = "Liberation Sans", size = 40);
    }
    translate([2.5, -0.1, 0])
        cube([size, 0.2, 0.4]);
}
