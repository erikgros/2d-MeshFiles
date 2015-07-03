// circular drop on surface bound by walls //

Mesh.Points = 1;
Mesh.Lines = 1;
Mesh.CharacteristicLengthMax = 0.5;
//Printf("MAX LEN %g", Mesh.CharacteristicLengthMax );

b1 = 0.02; // bubble fine
b2 = 0.06; // bubble coarse
wall = 0.2;

/* defining drop shape: */

r = 1.0; // drop radius
xc = 0.0; yc = 0.0; zc = 0.0; // drop center

/*              3
 *              o
 *            /   `,
 *         2 o  1o  o 4
 */

Point(1) = {  xc,   yc, zc, b2};   // center
Point(2) = {xc-r,   yc, zc, b1}; // left
Point(3) = {  xc, yc+r, zc, b2}; // up
Point(4) = {xc+r,   yc, zc, b1}; // right

Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 3, 1, 1, 4 };
Physical Line(Sprintf("bubble%g",1)) = {1, 2};

/* defining outer boundaries: */

lengthX = 5.0*r;
lengthY = 3.0*r;

k = newp;
Point(k+1) = { lengthX , 0.0, 0.0, wall};
Point(k+2) = {-lengthX , 0.0, 0.0, wall};

surf = newl;
Line(surf  ) = { k+1,   4 };
Line(surf+1) = {   4,   1 };
Line(surf+2) = {   1,   2 };
Line(surf+3) = {   2, k+2 };

Physical Line('wallWet') = { surf, surf+1, surf+2, surf+3 };

Extrude {0, lengthY, 0} {
  Point{k+1, k+2};
}
top = newl; Line(top) = { k+3, k+4 };

Physical Line('wallNoSlip') = { 7, 8 };
Physical Line('wallNoSlipPressure') = { top };

