/* Spherical bubble */
xc = 0.0;
yc = 0.0;
body = 0;
r = 0.5 * deq;

If( deq > 1 )
 Printf("spherical bubble. deq should be < 1!");
EndIf
/*
 *              3
 *              o
 *            /   \
 *         4 o  o  o 2
 *              1
 */

Point(1) = {     xc+r,   yc, 0.0, l2}; // center
Point(2) = { xc+2.0*r,   yc, 0.0, l1}; // right
Point(3) = {     xc+r, yc+r, 0.0, l1}; // up
Point(4) = {       xc,   yc, 0.0, l1}; // left

Ellipse(1) = { 4, 1, 1, 3 };
Ellipse(2) = { 3, 1, 1, 2 };

dist = 0.5*r; // distance from the bubble to the left and right sections

k = newp;
/*  k+2              k+4                 k+6               k+8
 *    o----------------o------------------o-----------------o
 *
 *
 *   k+1             k+3  4           2  k+5               k+7
 *    o----------------o--o------------o--o-----------------o
 */

Point(k+1) = {-(ll+dist),   0.0, 0.0, l3};
Point(k+2) = {-(ll+dist), D/2.0, 0.0, l3};

Extrude {ll, 0, 0} {
  Point{k+1, k+2};
}

Point(k+5) = {body+2*r+dist,   0.0, 0.0, l3};
Point(k+6) = {body+2*r+dist, D/2.0, 0.0, l3};

Extrude {lr, 0, 0} {
  Point{k+5, k+6};
}

top = newl; Line(top) = { k+4, k+6 };

br = newl; Line(br) = { 2, 1 };
bl = newl; Line(bl) = { 1, 4 };
left = newl; Line(left) = { 4, k+3 };
right = newl; Line(right) = { k+5, 2 };


in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+8, k+7};

Characteristic Length { k+3, k+4, k+5, k+6 } = l2;

/* Defining boundary conditions: */
Physical Line('wallPoiseuille') = { in };
Physical Line('wallOutflow') = { out };
Physical Line('wallNoSlip') = { 4, top, 6 };
Physical Line('wallNormalY') = { -3, -5, br, bl, left, right };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2};
