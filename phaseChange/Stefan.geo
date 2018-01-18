// mesh for 1d phase-change
f = 0.0025;
c = 0.0025;

ly = 0.005;
lx = 3.0;
li = 0.1;

Point(1) = { 0.0, 0.0, 0.0, c };
Point(2) = { 0.0,  ly, 0.0, c };
Point(3) = {  li,  ly, 0.0, c };
Point(4) = {  lx,  ly, 0.0, c };
Point(5) = {  lx, 0.0, 0.0, c };
Point(6) = {  li, 0.0, 0.0, c };

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};
Line(7) = {6, 3};

Physical Line('wallNoSlipT') = {1};
Physical Line('wallOutflow') = {4};
Physical Line('bubble1') = {7};
Physical Line('wallNormalY') = {2, 3, 5, 6};
