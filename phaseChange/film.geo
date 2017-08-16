// fibre geometry scaled by fiber radius
b = 0.02;
w = 0.02;

h = 0.3;
Dr = 1.8 * h;
Dx = 1.0;
A = 0.0;//0.4 * h; // displacement of spline control points

Point(1) = { 0.0, Dr, 0.0, w };
Point(2) = {  Dx, Dr, 0.0, w };
Point(3) = {  Dx,  h, 0.0, b };
Point(4) = {  Dx,0.0, 0.0, w };
Point(5) = { 0.0,0.0, 0.0, w };
Point(6) = { 0.0,  h, 0.0, b };
Point(7) = { Dx / 4.0,  h-A, 0.0, b };
Point(8) = { 3.0 * Dx / 4.0,  h+A, 0.0, b };

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
BSpline(7) = {6, 7, 8, 3};

Physical Line('wallOutflow') = {1};
Physical Line('wallRight') = {2, 3};
Physical Line('wallLeft') = {5, 6};
Physical Line('wallNoSlip') = {4};
Physical Line('bubble1') = {7};
