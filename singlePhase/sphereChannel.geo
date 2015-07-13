/* x-axis-symmetric flow around a sphere in a channel */

l1 = 0.01;  // coarse
l2 = 0.09;  // fine

D = 1.0; // channel diameter
front = 0.5*D;
back = 0.5*D;
dist = D;

// sphere:
r = 0.2*D; // sphere radius
xc = 0.0;
yc = 0.0;

Point(1) = {xc,   yc, 0.0}; // center
Point(2) = {xc-r, yc, 0.0, l1}; // left
Point(3) = {xc, yc+r, 0.0, l1}; // up
Point(4) = {xc+r, yc, 0.0, l1}; // right

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 3, 1, 1, 4 };

k = newp;
/*  k+4              k+2                 k+6               k+8
 *    o----------------o------------------o-----------------o
 *
 *
 *   k+3             k+1     2      4    k+5               k+7
 *    o----------------o----o        o----o-----------------o
 */

Point(k+1) = {-(r+dist),   0.0, 0.0, l2};
Point(k+2) = {-(r+dist), D/2.0, 0.0, l2};

Extrude {-front, 0, 0} {
  Point{k+01, k+02};
}

Point(k+5) = {r+dist,   0.0, 0.0, l2};
Point(k+6) = {r+dist, D/2.0, 0.0, l2};

Extrude {back, 0, 0} {
  Point{k+05, k+06};
}

top = newl; Line(top) = { k+2, k+6 };
left = newl; Line(left) = { 2, k+1 };
right = newl; Line(right) = { 4, k+5 };
in = newl; Line(in) = {k+3, k+4};
out = newl; Line(out) = {k+7, k+8};

// boundary conditions:
Physical Line('wallInflowU') = { in };
Physical Line('wallOutflow') = { out };
Physical Line('wallNoSlip') = { 1, 2, top, 4, 6 };
Physical Line('wallNormalV') = { left, right, 3, 5 };  // symmetry bc

