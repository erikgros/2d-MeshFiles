/* mesh for annular */
c = 0.05;
f = 0.02;

D = 2.0; // pipe diameter
Di = 2.0 * 0.9;
wallLength = 6.0; // pipe length
A = 0.01; // perturbation amplitude

Point(1) = {-wallLength/2.0,    D/2.0, 0.0, c};
Point(2) = { wallLength/2.0,    D/2.0, 0.0, c};
Point(3) = {-wallLength/2.0,      0.0, 0.0, c};
Point(4) = { wallLength/2.0,      0.0, 0.0, c};
Point(5) = {-wallLength/2.0, Di/2.0+A, 0.0, f};
Point(6) = { wallLength/2.0, Di/2.0+A, 0.0, f};

line = newl;
Line( line ) = {5, 6};

l = newl;
// inlet:
Line(l) = {3, 5};
Line(l+1) = {5, 1};
//Physical Line('wallLeft') = {l, l+1};

// symmetry line:
Line(l+2) = {4, 3};
Physical Line('wallNormalY') = {l+2};

// outlet:
Line(l+3) = {2, 6};
Line(l+4) = {6, 4};
//Physical Line('wallRight') = {l+3, l+4};
Physical Line('wallNormalX') = {l, l+1, l+3, l+4};

// upper wall:
Line(l+5) = {1, 2};
Physical Line('wallNoSlip') = {l+5};

// interface:
Physical Line('bubble1') = {line};
