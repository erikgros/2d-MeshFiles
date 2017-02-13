/* upper half of a symmetric channel heated after 8 D */
wall = 0.1;

D = 1.0; // channel height
wallLength = 20.0; // channel length

Point(1) = { 0.0, D/2.0, 0.0, wall };
Point(2) = { 8.0 * D, D/2.0, 0.0, wall };
Point(3) = { wallLength, D/2.0, 0.0, wall };
Point(4) = { 0.0,   0.0, 0.0, wall };
Point(5) = { wallLength,   0.0, 0.0, wall };

l = newl;
// inlet:
Line(l) = {1, 4};
Physical Line('wallConstUT') = {l};

// symmetry line:
Line(l+1) = {4, 5};
Physical Line('wallNormalY') = {l+1};

// outlet:
Line(l+2) = {5, 3};
Physical Line('wallOutflow') = {l+2};

// heaed wall:
Line(l+3) = {3, 2};
Physical Line('wallNoSlipH') = {l+3};

// adiabatic wall:
Line(l+4) = {2, 1};
Physical Line('wallNoSlip') = {l+4};
