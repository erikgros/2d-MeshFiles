/* upper half of a spherical bubble in channel with constant temperature */
wall = 0.09;
bub = 0.01;

D = 1.0;
r = 0.025 * D;
wallLength = 5.0; // channel length

Point(1) = { 0.0, D/2.0, 0.0, wall };
Point(2) = { 2.0 * D, D/2.0, 0.0, wall };
Point(3) = { wallLength, D/2.0, 0.0, wall };
Point(4) = { 0.0,   0.0, 0.0, bub };
Point(5) = { wallLength,   0.0, 0.0, wall };

/* Bubble shape: */
xc = 0.25 * D;
yc = 0.0;
Point(6) = {     xc+r,   yc, 0.0, bub}; // center
Point(7) = {     xc+r, yc+r, 0.0, bub}; // up
Point(8) = {       xc,   yc, 0.0, bub}; // left
Point(9) = { xc+2.0*r,   yc, 0.0, bub}; // right

Ellipse(1) = { 9, 6, 6, 7 };
Ellipse(2) = { 7, 6, 6, 8 };
Physical Line(Sprintf("bubble%g",1)) = {-1, -2};

l = newl;
// inlet:
Line(l) = {1, 4};
Physical Line('wallConstU') = {-l};

// symmetry line:
Line(l+1) = {4, 8};
Line(l+2) = {8, 6};
Line(l+3) = {6, 9};
Line(l+4) = {9, 5};
Physical Line('wallNormalY') = {-(l+1), -(l+2), -(l+3), -(l+4)};

l = newl;
// outlet:
Line(l+2) = {5, 3};
Physical Line('wallOutflow') = {-(l+2)};

// isothermal wall:
Line(l+3) = {3, 2};
Line(l+4) = {2, 1};
Physical Line('wallNoSlipT') = {-(l+3), -(l+4)};
