// here the geometry of a taylor bubble is defined

i=100*t;
j=200*t;

/*              6           2
 *              o --------- o 
 *            /              `,     
 *          8 o o 5       1 o  o 4    
 *            \              ,'
 *              o --------- o 
 *              7           3
 */

Point(i+1) = {xc+r+body, yc, zc,   b2}; // center
Point(i+2) = {xc+r+body, yc+r, zc, b1}; // up
Point(i+3) = {xc+r+body, yc-r, zc, b1}; // down
Point(i+4) = {xc+r+body+r, yc, zc, b2}; // right
Point(i+5) = {xc+r, yc, zc,   b2};      // center
Point(i+6) = {xc+r, yc+r, zc, b1};      // up
Point(i+7) = {xc+r, yc-r, zc, b1};      // down
Point(i+8) = {xc, yc, zc, b2};          // right

/*
bC=2*b2;  // mesh coarser in the middle
eB=0.025;
Point(i+9 ) = {xc+r/2.0+body+r-eB, yc, zc,   b1};  // 4 in
Point(i+10) = {xc+r/2.0+body+r+eB, yc, zc, b1};    // 4 out
Point(i+11) = {xc+r/2.0+body-eB, yc+r-eB, zc, b1}; // 2 in
Point(i+12) = {xc+r/2.0+body+eB, yc+r+eB, zc, b1}; // 2 out
Point(i+13) = {xc+r/2.0+body-eB, yc-r+eB, zc, b1}; // 3 in
Point(i+14) = {xc+r/2.0+body+eB, yc-r-eB, zc, b1}; // 3 out
Point(i+15) = {xc+eB, yc, zc,   b1};          // 8 in
Point(i+16) = {xc-eB, yc, zc, b1};          // 8 out
Point(i+17) = {xc+r/2.0+eB, yc+r-eB, zc, b1}; // 6 in
Point(i+18) = {xc+r/2.0-eB, yc+r+eB, zc, b1}; // 6 out
Point(i+19) = {xc+r/2.0+eB, yc-r+eB, zc, b1}; // 7 in
Point(i+20) = {xc+r/2.0-eB, yc-r-eB, zc, b1}; // 7 out

// middle points to coarsen the mesh
Point(21) = {xc+r/2.0+body/2.0, yc, zc, bC};
Point(22) = {xc+r/2.0+body/2.0, yc+r*0.35, zc, bC};
Point(23) = {xc+r/2.0+body/2.0, yc-r*0.35, zc, bC};
*/

Ellipse(j+1) = {i+2, i+1, i+1, i+4};
Ellipse(j+2) = {i+4, i+1, i+1, i+3};
Ellipse(j+3) = {i+7, i+5, i+5, i+8};
Ellipse(j+4) = {i+8, i+5, i+5, i+6};
Line(j+5) = {i+6, i+2};
Line(j+6) = {i+3, i+7};
