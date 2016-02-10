// axisymmetric Rayleigh-Taylor instability
b = 0.02;
w = 0.1;

A = 0.05; // amplitude of initial disturbance
r0 = 0.0;
Dr = 4.0;
zL = r0 + Dr*0.55; // zero level of disturbance
Dx = 1.0;

Point(1) = {     0.0,      r0, 0.0, w };
Point(2) = {     0.0, r0+zL+A, 0.0, b };
Point(3) = {     0.0,   r0+Dr, 0.0, w };
Point(4) = {      Dx,   r0+Dr, 0.0, w };
Point(5) = {      Dx, r0+zL+A, 0.0, b };
Point(6) = {      Dx,      r0, 0.0, w };
Point(7) =  { 0.125*Dx, r0+zL+0.8*A, 0.0, b };
Point(8) =  { 0.25*Dx,        r0+zL, 0.0, b };
Point(9) =  { 0.375*Dx, r0+zL-0.8*A, 0.0, b };
Point(10) = {  0.5*Dx,      r0+zL-A, 0.0, b };
Point(11) = { 0.625*Dx, r0+zL-0.8*A, 0.0, b };
Point(12) = { 0.75*Dx,        r0+zL, 0.0, b };
Point(13) = { 0.875*Dx, r0+zL+0.8*A, 0.0, b };

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};

BSpline(7) = {2, 7, 8, 9, 10, 10, 10, 11, 12, 13, 5};

Periodic Line {4, 5} = {-2,-1};

Physical Line('wallLeft') = {1, 2};
Physical Line('wallRight') = {4, 5};
Physical Line('bubble1') = {7};
Physical Line('wallNormalY') = {6};
Physical Line('wallNormalYp') = {3};
