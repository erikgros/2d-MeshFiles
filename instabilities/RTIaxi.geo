// axisymmetric Rayleigh-Taylor instability
b = 0.005;
w = 0.04;

A0 = b;
r0 = 0.0;
r1 = 0.5;
Dx = 4.0;

Point(1) = {     0.0,  r1, 0.0, w };
Point(2)={ 0.6*Dx-0.4*A0,  r1, 0.0, b };
Point(3) = {      Dx,  r1, 0.0, w };
Point(4) = {      Dx,  r0, 0.0, w };
Point(5)={ 0.6*Dx+A0,  r0, 0.0, b };
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
