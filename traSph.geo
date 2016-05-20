// sphere for translating drop
full = 0;
l1 = 0.1; // fine
l2 = 0.1; // coarse

h = 1.0; // domain height
l = 10.0; // total domain length

/* Defining bubble shape (half circle): */
r = 0.5;
Point(1) = { 0.0, 0.0, 0.0, l1}; // center
Point(2) = { 0.0,   r, 0.0, l1}; // up
Point(3) = {   r, 0.0, 0.0, l1}; // right
Point(4) = {  -r, 0.0, 0.0, l1}; // left
Ellipse(1) = { 2, 1, 1, 3 };
Ellipse(2) = { 4, 1, 1, 2 };
If ( full == 1 )
 Point(5) = { 0.0,   -r, 0.0, l1}; // down
 Ellipse(3) = { 3, 1, 1, 5 };
 Ellipse(4) = { 5, 1, 1, 4 };
EndIf

k = newp;
/*  k+2                          k+3
 *    o---------------------------o
 *
 *
 *  k+1   4       3              k+4
 *    o---o-------o---------------o
 */
If ( full == 1 )
 Point(k+1) = { -1.0,  -h, 0.0, l2};
 Point(k+2) = { -1.0,   h, 0.0, l2};
 Point(k+3) = { l-1.0,  h, 0.0, l2};
 Point(k+4) = { l-1.0, -h, 0.0, l2};
 top = newl; Line(top) = { k+2, k+3 };
 bot = newl; Line(bot) = { k+4, k+1 };
EndIf
If ( full == 0 )
 Point(k+1) = { -1.0,  0.0, 0.0, l2};
 Point(k+2) = { -1.0,    h, 0.0, l2};
 Point(k+3) = { l-1.0,   h, 0.0, l2};
 Point(k+4) = { l-1.0, 0.0, 0.0, l2};
 top = newl; Line(top) = { k+2, k+3 };
 bl = newl; Line(bl) = { 1, 4 };
 br = newl; Line(br) = { 3, 1 };
 left = newl; Line(left) = { 4, k+1 };
 right = newl; Line(right) = { k+4, 3 };
EndIf
in = newl; Line(in) = {k+1, k+2};
out = newl; Line(out) = {k+3, k+4};

/* Boundary conditions: */
Physical Line('wallConstU') = { in, out };
If ( full == 1 )
 Physical Line(Sprintf("bubble%g",1)) = { 1, 2, 3, 4 };
 Physical Line('wallNormalY') = { bot, top }; // symmetry bc
EndIf
If ( full == 0 )
 Physical Line(Sprintf("bubble%g",1)) = { 1, 2 };
 Physical Line('wallNormalY') = { bl, br, left, right, top }; // symmetry bc
EndIf
