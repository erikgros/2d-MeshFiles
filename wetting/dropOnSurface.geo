// circular drop on surface bound by walls //

Mesh.Points = 1;
Mesh.Lines = 1;
Mesh.CharacteristicLengthMax = 0.5;
//Printf("MAX LEN %g", Mesh.CharacteristicLengthMax );

b1 = 0.03;
b2 = 0.05;
wall = 0.2;

/* defining drop shape: */

r = 1.0; // drop radius
xc = 0.0; yc = 0.0; zc = 0.0; // drop center

/*              3
 *              o
 *            /   `,
 *         2 o  1o  o 4
 */

Point(1) = {xc, yc, zc, b1}; // center
Point(2) = {xc-r, yc, zc, b1}; // left
Point(3) = {xc, yc+r, zc, b2}; // up
Point(4) = {xc+r, yc, zc, b1}; // right

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 3, 1, 1, 4 };
Physical Line(Sprintf("bubble%g",1)) = {1, 2};

/* defining outer boundaries: */

lengthX = 5.0*r;
lengthY = 3.0*r;

k = newp;
Point(k+1) = { lengthX , 0.0, 0.0, wall};
Point(k+2) = {-lengthX , 0.0, 0.0, wall};

right = newl; Line(right) = { k+1, 4 };
base = newl; Line(base) = { 4, 2 };
left = newl; Line(left) = { 2, k+2 };

Physical Line('wallWet') = { right, base, left };

Extrude {0, lengthY, 0} {
  Point{k+1, k+2};
}
top = newl; Line(top) = { k+3, k+4 };

Physical Line('wallNoSlip') = { right+3, right+4, top };

Transfinite Line { base } = 39 Using Bump 0.5;
