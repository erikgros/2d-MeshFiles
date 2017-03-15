// symmetric bubble, same scale as Hysing (d=0.5)
Printf("Quantitative benchmark computations of two-dimensional bubble dynamics, Int. J. for Num. Meth. in Fluids, vol. 60 pp. 1259-1288 (2008)");
D = 1.0;
l = 2.0;
dist = 0.5;
l1 = 0.01;
l2 = 0.06;

/* Defining bubble shape (circle with diameter d, cetered at origin): */
Point(1) = {   0.0, 0.0, 0.0, l1 }; // center
Point(2) = {   0.0,0.25, 0.0, l1 }; // up
Point(3) = {  0.25, 0.0, 0.0, l1 }; // right
Point(4) = { -0.25, 0.0, 0.0, l1 }; // left
Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };
k = newp;
/*  k+2                                   k+3
 *    o------------------------------------o
 *
 *
 *   k+1   4       3                      k+4
 *    o----o-------o-----------------------o
 */
Point(k+1) = {  -dist,   0.0, 0.0, l2};
Point(k+2) = {  -dist, D/2.0, 0.0, l2};
Point(k+3) = { l-dist, D/2.0, 0.0, l2};
Point(k+4) = { l-dist,   0.0, 0.0, l2};

top = newl; Line(top) = { k+2, k+3 };
bl = newl; Line(bl) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
left = newl; Line(left) = { 4, k+1 };
right = newl; Line(right) = { k+4, 3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
Printf("Slip walls");
Physical Line('wallNoSlipP') = { in, out };
Physical Line('wallNormalY') = { top, bl, br, left, right };  // symmetry bc
