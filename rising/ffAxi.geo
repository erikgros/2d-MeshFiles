// axisymmetric rising bubble using fixed frame

l1 = 0.02; // fine
l2 = 0.5;  // coarse

D = 8.0; // channel diameter
l = 9.0; // length of the domain

/* Defining bubble shape (circular): */
r = 0.5;

Point(1) = {     r, 0.0, 0.0, l1}; // center
Point(2) = {     r,   r, 0.0, l1}; // up
Point(3) = { 2.0*r, 0.0, 0.0, l1}; // right
Point(4) = {   0.0, 0.0, 0.0, l1}; // left

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };

dist = 3.0*r; // distance between bubble and boundary

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
left = newl; Line(left) = { 4, k+1 };
right = newl; Line(right) = { k+4, 3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
Physical Line('wallNoSlip') = { top, in, out };
Physical Line('wallNormalY') = { bl, br, left, right };  // symmetry bc
