// microchannel flow using moving frame

Mesh.Points = 1;
Mesh.Lines = 1;
Mesh.CharacteristicLengthMax = 0.5;
//Printf("MAX LEN %g", Mesh.CharacteristicLengthMax );

nb = 1; // number of bubbles

b1 = 0.016;  // bubble fine
b2 = 0.05;   // bubble coarse
wall1 = 0.015; // film
wall2 = 0.08; // coarse

D = 1.0;
r = 0.45*D; //0.3*D; // bubble radius
body = 0.534225*D; //1.39039*D; // bubble length
slug = 0.7*r;

For t In {0:nb-1}
 xc = 0.0+(slug+body+3.0*r/2.0)*t;
 yc = 0.0;
 zc = 0.0;
 Include '../bubbleShape/taylor.geo';
EndFor

wallLength1 = 2.5*D;
wallLength2 = 0.4+nb*(body+3*r/2.0)+(nb-1)*slug;
wallLength3 = 1.5*D;
eG = 0.1; // distance left

k=10000;
Point(k+1) = {-wallLength1 , -(D/2.0), 0.0, wall2};
Point(k+2) = {-wallLength1 , +(D/2.0), 0.0, wall2};

Extrude {wallLength1-eG, 0, 0} {
  Point{k+01, k+02};
}
Extrude {wallLength2, 0, 0} {
  Point{k+03, k+04};
}
Extrude {wallLength3, 0, 0} {
  Point{k+05, k+06};
}

Characteristic Length { k+3, k+4, k+5, k+6 } = wall1;

/* // creating nP points at the centerline right and left from the bubble:
nP = 4;
For ii In {1:nP}
 Point( k+10+2*ii-1 ) = { -eG - ii * wallLength1 / (nP+1.0) , 0.0, 0.0, wall1 };
 Point( k+10+2*ii ) = { wallLength2 -eG + ii * wallLength3 / (nP+1.0) , 0.0, 0.0, wall1 };
EndFor
Characteristic Length { k+9+2*nP, k+12  } = ( wallC + b1) / 2.0;
*/

Line(13) = {k+07, k+08};
Line(14) = {k+01, k+02};

Physical Line('wallInflowUParabolic') = { 13, 14 };
Physical Line('wallNoSlipPressure') = {7, 9, 11, 12, 10, 8};

jj=200*0;
For t In {1:nb}
 Physical Line(Sprintf("bubble%g",t)) = {jj+6, jj+2, jj+1, jj+5, jj+4, jj+3};
 jj=200*t;
EndFor
//Transfinite Line { 7, 8 } = 30 Using Progression 0.97; // left
//Transfinite Line { 11, 12 } = 14 Using Progression 100/95; // right
