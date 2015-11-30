/* upper half of a (axis-)symmetric channel with periodic inlet/outlet */
wall = 0.1;

D = 1.0; // channel height
wallLength = 4.0; // channel length

Point(1) = {-wallLength/2.0, D/2.0, 0.0, wall};
Point(2) = { wallLength/2.0, D/2.0, 0.0, wall};
Point(3) = {-wallLength/2.0,   0.0, 0.0, wall};
Point(4) = { wallLength/2.0,   0.0, 0.0, wall};

l = newl;
// inlet:
Line(l) = {3, 1};
Physical Line('wallLeft') = {l};

// symmetry line:
Line(l+1) = {4, 3};
Physical Line('wallNormalY') = {l+1};

// outlet:
Line(l+2) = {2, 4};
Physical Line('wallRight') = {l+2};

// upper wall:
Line(l+3) = {1, 2};
Physical Line('wallNoSlipP') = {l+3};

Periodic Line { l } = { l+2 };
