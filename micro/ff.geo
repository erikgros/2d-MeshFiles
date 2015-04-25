// microchannel flow using fixed frame
 
nb = 1;
b1 = 0.04;  // bubble fine
b2 = 0.09;   // bubble coarse
b = b1; // for 2d-sepideh-bubble.geo shape-file
wall = 0.05;
wallC = 0.12;

D = 1.0;
r = 0.3*D; //0.45*D; // bubble radius
body = 1.88834*D; //0.417042*D; // bubble length
slug = 0.7*r;

For t In {0:nb-1}
 // bubble's coordinates
 xc = 0.0+(slug+body+r+r/2.0)*t;
 yc = 0.0;
 zc = 0.0;

 // including bubble shape file:
 Include '../bubbleShape/taylor.geo';
EndFor

wallLength1 = 0.6*D;
wallLength2 = 0.9+nb*(body+3*r/2.0)+(nb-1)*slug;
wallLength3 = 3.5*D;

k=10000;
Point(k+1) = {-wallLength1 ,-(D/2.0), 0.0, wall}; // p1
Point(k+2) = {-wallLength1 ,+(D/2.0), 0.0, wall}; // p2
//Point(k+23) = {-wallLength1+0.00001 ,+(D/2.0)-0.00001, 0.0, wallC};
//Point(k+24) = {-wallLength1+0.00001 ,-(D/2.0)+0.00001, 0.0, wallC};

Extrude {wallLength1-0.3, 0, 0} {
  Point{k+01, k+02};
}
Extrude {wallLength2, 0, 0} {
  Point{k+03, k+04};
}
Extrude {wallLength3, 0, 0} {
  Point{k+05, k+06};
}

Line(13) = {k+07, k+08};
Line(14) = {k+01, k+02};

Physical Line('wallInflowUParabolic') = { 14 };
Physical Line('wallOutflow') = { 13 };
Physical Line('wallNoSlip') = {7, 9, 11, 12, 10, 8};

jj=200*0;
For t In {1:nb}
Physical Line(Sprintf("bubble%g",t)) = {jj+6, jj+2, jj+1, jj+5, jj+4, jj+3};
 jj=200*t;
EndFor

Transfinite Line { 13 } = 11 Using Progression 1; // outlet
Transfinite Line { 14 } = 12 Using Progression 1; // inlet
Transfinite Line { 7, 8 } = 6 Using Progression 0.9; // left
Transfinite Line { 11, 12 } = 46 Using Progression 100/99;// right
