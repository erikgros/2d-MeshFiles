/* simple 2d channel */
wall = 0.1;

D = 1.0; // channel height
wallLength = 4.0; // channel length

Point(1) = {-wallLength/2.0,  D/2.0, 0.0, wall};
Point(2) = { wallLength/2.0,  D/2.0, 0.0, wall};
Point(3) = {-wallLength/2.0, -D/2.0, 0.0, wall};
Point(4) = { wallLength/2.0, -D/2.0, 0.0, wall};

l = newl;
// inlet:
Line(l) = {1, 3};
Physical Line('wallInflowU') = {l};

// lower wall:
Line(l+1) = {3, 4};

// outlet:
Line(l+2) = {4, 2};
Physical Line('wallOutflow') = {l+2};

// upper wall:
Line(l+3) = {2, 1};
Physical Line('wallNoSlip') = {l+1, l+3};

//Transfinite Line {1, 3} = 100 Using Progression 1;
//Transfinite Line {4, 2} = 20 Using Progression 1;
