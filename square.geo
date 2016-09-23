b = 0.025;

Dy = 1.0;
Dx = 1.0;

Point(1) = {      0.0,    0.0, 0.0, b };
Point(2) = {      0.0,    0.5, 0.0, b };
Point(3) = {      0.0,     Dy, 0.0, b };
Point(4) = {       Dx,     Dy, 0.0, b };
Point(5) = {       Dx,    0.5, 0.0, b };
Point(6) = {       Dx,    0.0, 0.0, b };

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
Line(7) = {2, 5};

Physical Line('wallNormalXv') = {1, 2, 3, 4, 5, 6};
Physical Line('bubble1') = {7};
