// axisymmetric drop on surface
b = 0.08; // bubble
wall = 0.2;

r = 1.0; // drop radius
lengthX = 3.0*r;
lengthR = 3.0*r;

Point(1) = { 0.0, 0.0, 0.0, b}; // center
Point(2) = { 0.0,   r, 0.0, b}; // cp
Point(3) = {   r, 0.0, 0.0, b};

Ellipse(1) = { 2, 1, 1, 3 };
Physical Line(Sprintf("bubble%g",1)) = { 1 };

/* defining outer boundaries: */
k = newp;
Point(k+1) = { lengthX,     0.0, 0.0, wall};
Point(k+2) = {     0.0, lengthR, 0.0, wall};
Point(k+3) = { lengthX, lengthR, 0.0, wall};

surf = newl;
Line(surf) = { k+1, 3 };
Line(surf+1) = { 3, 1 };
Line(surf+2) = { 1, 2 };
Line(surf+3) = { 2, k+2 };
Line(surf+4) = { k+2, k+3 };
Line(surf+5) = { k+3, k+1 };

Physical Line('wallWet') = { surf+3, surf+2 };
Physical Line('wallNormalY') = { surf, surf+1 };
Physical Line('wallNormalYp') = { surf+4 };
Physical Line('wallNormalX') = { surf+5 };
