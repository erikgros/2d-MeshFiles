// axisymmetric Rayleigh-Taylor instability
Mesh.Points = 1;
Mesh.Lines = 1;

b = 0.03;
w = 0.08;

A = 0.3; // initial disturbance amplitude
D = 2.0;
dj = 1.0;
L = 3.0;

Point(1) = {0.0, 0.0, 0.0, w};
Point(2) = {0.0,  dj, 0.0, b};
Point(3) = {0.0,   D, 0.0, w};
Point(4) = {  L,   D, 0.0, w};
Point(5) = {  L,  dj, 0.0, b};
Point(6) = {  L, 0.0, 0.0, w};
Point(7) = {0.25*L, dj+A, 0.0, b};
Point(8) = {0.75*L, dj-A, 0.0, b};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
BSpline(7) = {2, 7 , 8 , 5};
//Line(7) = {2, 7};
//Line(8) = {7, 8};
//Line(9) = {8, 5};

Periodic Line {4, 5} = {-2,-1};

Physical Line('wallLeft') = {1, 2};
Physical Line('wallRight') = {4, 5};
Physical Line('bubble1') = {7};
//Physical Line('bubble1') = {7, 8, 9};
Physical Line('wallNormalY') = {6};
Physical Line('wallNoSlip') = {3};
