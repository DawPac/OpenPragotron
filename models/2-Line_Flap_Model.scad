size = 225;
text_high = "Łódź";
text_low = "Fabryczna";

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



translate([10, 10, 0.2]) {
linear_extrude(height = 0.2)
    text(text_high, font = "Liberation Sans", size = 20);
}

translate([10, -25, 0.2]) {
linear_extrude(height = 0.2)
    text(text_low, font = "Liberation Sans", size = 20);
}
