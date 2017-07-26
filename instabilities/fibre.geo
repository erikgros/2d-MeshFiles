// fibre geometry scaled by fiber radius
b = 0.4;
w = 0.4;

h = 0.52 / 0.2;
r0 = 1.0;
Dr = 3.0 * h;
Dx = 7.0/0.2;
A = 0.4 * h; // displacement of spline control points

Point(1) = { 0.0, r0+Dr, 0.0, w };
Point(2) = {  Dx, r0+Dr, 0.0, w };
Point(3) = {  Dx,  r0+h, 0.0, b };
Point(4) = {  Dx,    r0, 0.0, w };
Point(5) = { 0.0,    r0, 0.0, w };
Point(6) = { 0.0,  r0+h, 0.0, b };
Point(7) = { Dx / 4.0,  r0+h-A, 0.0, b };
Point(8) = { 3.0 * Dx / 4.0,  r0+h+A, 0.0, b };

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
BSpline(7) = {6, 7, 8, 3};

Physical Line('wallNormalYp') = {1};
Physical Line('wallRight') = {2, 3};
Physical Line('wallLeft') = {5, 6};
//Physical Line('wallConstP') = {5, 6};
//Physical Line('wallOutflow') = {2, 3};
Physical Line('wallNoSlip') = {4};
Physical Line('bubble1') = {7};

//Periodic Line { 2 } = { 6 };
//Periodic Line { 3 } = { 5 };
