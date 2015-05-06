// x-axis-symmetric microchannel flow using moving frame

Mesh.Points = 1;
Mesh.Lines = 1;
Mesh.CharacteristicLengthMax = 0.5;
//Printf("MAX LEN %g", Mesh.CharacteristicLengthMax );

b1 = 0.035;  // bubble
wall1 = 0.035; // film
wall2 = 0.14; // coarse

/* Defining bubble shape: */
D = 1.0;
r = 0.45*D; //0.3*D; // bubble radius
body = 0.534225*D; //1.39039*D; // bubble length
slug = 0.7*r;

xc = 0.0;
yc = 0.0;
zc = 0.0;

wallLength1 = 3.5*D;
wallLength2 = 0.4+body+3*r/2.0;
wallLength3 = 3.0*D;
eG =0.15; // shift left

/*
 *              5           2
 *              o --------- o 
 *            /              `,     
 *          6 o o 4       1 o  o 3
 *
 */

Point(1) = {xc+r+body, yc, zc, b1}; // center
Point(2) = {xc+r+body, yc+r, zc, b1}; // up
Point(3) = {xc+r+body+r, yc, zc, b1}; // right
Point(4) = {xc+r, yc, zc, b1}; // center
Point(5) = {xc+r, yc+r, zc, b1}; // up
Point(6) = {xc, yc, zc, b1}; // left

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 6, 4, 4, 5 };
Line(3) = { 5, 2 };

k = newp;

/*  k+2              k+4                 k+6               k+8
 *    o----------------o------------------o-----------------o
 *
 *
 *   k+1             k+3  6           3  k+5               k+7
 *    o----------------o--o------------o--o-----------------o
 */

Point(k+1) = {-wallLength1 , 0.0, 0.0, wall2};
Point(k+2) = {-wallLength1 , D/2.0, 0.0, wall2};

Extrude {wallLength1-eG, 0, 0} {
  Point{k+01, k+02};
}

Point(k+5) = {wallLength2-eG , 0.0, 0.0, wall2};
Point(k+6) = {wallLength2-eG , D/2.0, 0.0, wall2};

Extrude {wallLength3, 0, 0} {
  Point{k+05, k+06};
}

Line(newl) = { k+4, k+6 };

bubbleWall = newl;
Line(bubbleWall) = {  3, 6 };
Line(newl) = { k+3, 6 };
Line(newl) = { 3, k+5 };

in = newl;
Line(in) = {k+1, k+2};
out = newl;
Line(out) = {k+7, k+8};

Characteristic Length { k+3, k+4, k+5, k+6 } = wall1;

Transfinite Line { bubbleWall } = 37 Using Bump 0.3;

/* Defining boundary conditions: */
//Physical Point('contactPoint') = { 3, 6 };
Physical Line('wallInflowUParabolic') = { in, out };
Physical Line('wallNoSlipPressure') = { 5, 7, 8 };
Physical Line('wallNormalV') = { 9, 10, 11, 4, 6 };  // symmetry bc
Physical Line(Sprintf("bubble%g",1)) = {1, 2, 3};

