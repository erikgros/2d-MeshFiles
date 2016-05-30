/* annular pipe with one wave length of sinusoidal perturbation */
//Mesh.ElementOrder = 2;
wall = 0.05;

D = 1.0; // pipe diameter
wallLength = 5.0; // pipe length
ft = 0.15; // film thickness
A = 0.05; // perturbance amplitude

Di = D - 2.0 * ft;
Point(1) = {-wallLength/2.0,  D/2.0, 0.0, wall};
Point(2) = { wallLength/2.0,  D/2.0, 0.0, wall};
Point(3) = {-wallLength/2.0,    0.0, 0.0, wall};
Point(4) = { wallLength/2.0,    0.0, 0.0, wall};
Point(5) = {-wallLength/2.0, Di/2.0, 0.0, wall};
Point(6) = {-wallLength/4.0, Di/2.0+A, 0.0, wall};
Point(7) = {            0.0, Di/2.0, 0.0, wall};
Point(8) = { wallLength/4.0, Di/2.0-A, 0.0, wall};
Point(9) = { wallLength/2.0, Di/2.0, 0.0, wall};

spline = newl;
BSpline( spline ) = {5,6,7,8,9};

l = newl;
// inlet:
Line(l) = {3, 5};
Line(l+1) = {5, 1};
Physical Line('wallConstP') = {l, l+1};

// symmetry line:
Line(l+2) = {4, 3};
Physical Line('wallNormalY') = {l+2};

// outlet:
Line(l+3) = {2, 9};
Line(l+4) = {9, 4};
Physical Line('wallOutflow') = {l+3, l+4};

// upper wall:
Line(l+5) = {1, 2};
Physical Line('wallNoSlip') = {l+5};

// interface:
Physical Line('bubble1') = {spline};
