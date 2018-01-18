// 2D Rayleigh-Taylor instability with symmetric BCs
b = 0.0025;
w = 0.03;

A = 0.0005; // amplitude of initial disturbance
Dy = 1.0; // 2.0;
Dx = 0.5;

Point(1) = {      0.0,    -Dy, 0.0, w };
Point(2) = {      0.0,      A, 0.0, b };
Point(3) = {      0.0,     Dy, 0.0, w };
Point(4) = {       Dx,     Dy, 0.0, w };
Point(5) = {       Dx,     -A, 0.0, b };
Point(6) = {       Dx,    -Dy, 0.0, w };
Point(7) =  { 0.25*Dx,  0.8*A, 0.0, b };
Point(8) =  {  0.5*Dx,    0.0, 0.0, b };
Point(9) =  { 0.75*Dx, -0.8*A, 0.0, b };

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};

BSpline(7) = {2, 7, 8, 9, 5};

Physical Line('wallNormalX') = {1, 2, 4, 5};
Physical Line('bubble1') = {7};
//Physical Line('wallNormalY') = {6};
//Physical Line('wallNormalYp') = {3};
Physical Line('wallNoSlip') = {3, 6};
