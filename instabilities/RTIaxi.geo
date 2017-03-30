// axisymmetric Rayleigh-Taylor instability
// like in 4.1 of paper...
b = 0.01;
w = 0.09;

A0 = 0.015;
r0 = 0.001;
r1 = 0.501;
Dx = 3.0;

Point(1) = {     0.0,  r1, 0.0, w };
Point(2) = { Dx/2+A0,  r1, 0.0, b };
Point(3) = {      Dx,  r1, 0.0, w };
Point(4) = {      Dx,  r0, 0.0, w };
Point(5) = { Dx/2-A0,  r0, 0.0, b };
Point(6) = {     0.0,  r0, 0.0, w };
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
Line(7) = {5, 2};

Physical Line('wallNoSlip') = {3, 6};
Physical Line('wallNormalY') = {1, 4, 5};
Physical Line('wallNormalYp') = {2};
Physical Line('bubble1') = {7};
