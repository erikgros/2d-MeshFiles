// bubble flow with heat transfer using fixed frame
l1 = 0.04; // very fine
l2 = 0.07; // fine
l3 = 0.1; // coarse
tl = 8.0; // total length of the domain (12D?)

D = 1.0;                   // channel diameter (2*0.247 mm)
r = 0.2 / (2.0*0.247);     // bubble radius (0.2 mm)
body = 0.5 / (2.0*0.247);  // blength of central region (0.5 mm)

xl = 0.5 / (2.0*0.247) - r;
dist = 1.5 / (2.0*0.247) - (xl + body + 2.0 * r); // distance from the bubble to the heated section
lr = tl - ( xl + body + 2.0 * r + dist);  // length of the heated section

/*
 *              5           2
 *              o --------- o
 *            /              `,
 *          6 o o 4       1 o  o 3
 *
 */

Point(1) = {  xl+r+body, 0.0, 0.0, l2}; // center
Point(2) = {  xl+r+body,   r, 0.0, l1}; // up
Point(3) = {xl+r+body+r, 0.0, 0.0, l1}; // right
Point(4) = {       xl+r, 0.0, 0.0, l2}; // center
Point(5) = {       xl+r,   r, 0.0, l1}; // up
Point(6) = {         xl, 0.0, 0.0, l1}; // left

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 6, 4, 4, 5 };
Line(3) = { 5, 2 };

k = newp;
/*  k+2                                k+4               k+6
 *    o---------------------------------o-----------------o
 *
 *
 *   k+1             6            3                      k+5
 *    o--------------o------------o-----------------------o
 */

Point(k+1) = { 0.0,   0.0, 0.0, l3};
Point(k+2) = { 0.0, D/2.0, 0.0, l3};
Point(k+4) = {0.1,   D/2.0, 0.0, l3};
//Point(k+4) = {xl+body+2.0*r+dist, D/2.0, 0.0, l3};
Point(k+5) = {lr+xl+body+2.0*r+dist,   0.0, 0.0, l3};
Point(k+6) = {lr+xl+body+2.0*r+dist, D/2.0, 0.0, l3};

topl = newl; Line(topl) = { k+2, k+4 };
topQ = newl; Line(topQ) = { k+4, k+6 };
bc = newl; Line(bc) = { 1, 4 };
br = newl; Line(br) = { 3, 1 };
bl = newl; Line(bl) = { 4, 6 };
left = newl; Line(left) = { 6, k+1 };
right = newl; Line(right) = { k+5, 3 };
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+6, k+5};

/* Defining boundary conditions: */
Physical Line('wallConstP') = { in };
Physical Line('wallOutflow') = { out };
Physical Line('wallNoSlip') = { topl };
Physical Line('wallNoSlipT') = { topQ };
Physical Line('wallNormalY') = { bc, br, bl, left, right };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

