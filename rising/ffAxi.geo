// axisymmetric rising bubble using fixed frame

l1 = 0.02; // fine
l2 = 0.09;  // coarse

D = 1.0; // channel diameter
l = 6.0*D; // length of the domain

/* Defining bubble shape (circular): */
r = 0.25*D;
xc = 0.0;
yc = 0.0;

Point(1) = {    xc+r,   yc, 0.0, l2}; // center
Point(2) = {    xc+r, yc+r, 0.0, l1}; // up
Point(3) = {xc+2.0*r,   yc, 0.0, l1}; // right
Point(4) = {      xc,   yc, 0.0, l1}; // left

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };

dist = 1.5*r; // distance between bubble and boundary

k = newp;
/*  k+2                                   k+3
 *    o------------------------------------o
 *
 *
 *   k+1   4       3                      k+4
 *    o----o-------o-----------------------o
 */
Point(k+1) = {-dist,   0.0, 0.0, l2};
Point(k+2) = {-dist, D/2.0, 0.0, l2};
Point(k+3) = {2.0*r+l, D/2.0, 0.0, l2};
Point(k+4) = {2.0*r+l,   0.0, 0.0, l2};

top = newl; Line(top) = { k+2, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
left = newl; Line(left) = { k+1, 4 };
right = newl; Line(right) = { 3, k+4 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+4, k+3};

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
Physical Line('wallNoSlip') = { top, in, out };
Physical Line('wallNormalV') = { bl, br, left, right };  // symmetry bc
