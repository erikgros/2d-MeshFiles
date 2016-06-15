/* axisymmetric annular Poiseuille flow */
//Mesh.ElementOrder = 2;
wall = 0.0125;
f = wall;

D = 1.0; // pipe diameter
wallLength = 10.0 * wall; // pipe length
ft = 0.15; // film thickness

Di = D - 2.0 * ft;
Point(1) = {-wallLength/2.0,  D/2.0, 0.0, wall};
Point(2) = { wallLength/2.0,  D/2.0, 0.0, wall};
Point(3) = {-wallLength/2.0,    0.0, 0.0, wall};
Point(4) = { wallLength/2.0,    0.0, 0.0, wall};
Point(5) = {-wallLength/2.0, Di/2.0, 0.0, f};
Point(6) = { wallLength/2.0, Di/2.0, 0.0, f};

l = newl;
// inlet:
Line(l) = {3, 5};
Line(l+1) = {5, 1};
Physical Line('wallConstP') = {l, l+1};

// symmetry line:
Line(l+2) = {4, 3};
Physical Line('wallNormalY') = {l+2};

// outlet:
Line(l+3) = {2, 6};
Line(l+4) = {6, 4};
Physical Line('wallOutflow') = {l+3, l+4};

// upper wall:
Line(l+5) = {1, 2};
Physical Line('wallNoSlip') = {l+5};

// interface:
Line(l+6) = {5, 6};
Physical Line('bubble1') = {l+6};
