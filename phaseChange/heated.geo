/* upper half of a symmetric channel heated after 8 D */
wall = 0.06;
bub = 0.05;

D = 1.0; // channel height
delta = 0.045 * D;
r = 0.5 * D - delta;
body = 3.0 * D - 2.0 * r;
wallLength = 20.0; // channel length

Point(1) = { 0.0, D/2.0, 0.0, wall };
Point(2) = { 8.0 * D, D/2.0, 0.0, wall };
Point(3) = { wallLength, D/2.0, 0.0, wall };
Point(4) = { 0.0,   0.0, 0.0, wall };
Point(5) = { wallLength,   0.0, 0.0, wall };

/* Bubble shape: */
xc = 0.25 * D;
yc = 0.0;
Point(6)  = {  xc+r+body,   yc, 0.0, bub}; // center
Point(7)  = {  xc+r+body, yc+r, 0.0, bub}; // up
Point(8)  = {xc+r+body+r,   yc, 0.0, bub}; // right
Point(9)  = {       xc+r,   yc, 0.0, bub}; // center
Point(10) = {       xc+r, yc+r, 0.0, bub}; // up
Point(11) = {         xc,   yc, 0.0, bub}; // left

Ellipse(1) = { 8, 6, 6, 7 };
Ellipse(2) = { 10, 9, 9, 11 };
Line(3) = { 7, 10 };
Physical Line(Sprintf("bubble%g",1)) = {-1, -2, -3};

l = newl;
// inlet:
Line(l) = {1, 4};
Physical Line('wallConstUT') = {l};

// symmetry line:
Line(l+1) = {4, 11};
Line(l+2) = {11, 9};
Line(l+3) = {9, 6};
Line(l+4) = {6, 8};
Line(l+5) = {8, 5};
Physical Line('wallNormalY') = {-(l+1), -(l+2), -(l+3), -(l+4), -(l+5)};

l = newl;
// outlet:
Line(l+2) = {5, 3};
Physical Line('wallOutflow') = {-(l+2)};

// heaed wall:
Line(l+3) = {3, 2};
Physical Line('wallNoSlipH') = {-(l+3)};

// adiabatic wall:
Line(l+4) = {2, 1};
Physical Line('wallNoSlip') = {-(l+4)};
