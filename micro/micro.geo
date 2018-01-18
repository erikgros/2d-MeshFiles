// axisymmetric bubble in microchannel
Case = 17;
D = 1.0; // channel diameter
Mesh.ElementOrder = 1;

/* Case 17: */
l1 = 0.025; // very fine
l2 = 0.05; // fine
l3 = 0.08; // coarse

V = 78e-12; // bubble volume in m^3
Ddim = 494e-6; // channel diameter in m
deq = 1.354;

ll = 0.5*D; // length of the left section
lr = 5.5*D; // length of the right section

If( Case == 17 )
 Include 'ffEloSym.geo';
EndIf
If( Case == 1 )
 l1 = 0.04; // very fine
 l2 = 0.08; // fine
 l3 = 0.1; // coarse

 V = 2.8e-12; // bubble volume in m^3
 deq = 0.354;

 ll = 0.5*D; // length of the left section
 lr = 4.5*D; // length of the right section
 Include 'ffSphSym.geo';
EndIf
If( Case == 2 )
 l1 = 0.02; // very fine
 l2 = 0.06; // fine
 l3 = 0.07; // coarse

 V = 8.5e-12; // bubble volume in m^3
 deq = 0.513;

 ll = 1.0*D; // length of the left section
 lr = 4.5*D; // length of the right section
 Include 'ffSphSym.geo';
EndIf
If( Case == 3 )
 l1 = 0.025; // very fine
 l2 = 0.04; // fine
 l3 = 0.08; // coarse

 V = 19.6e-12; // bubble volume in m^3
 deq = 0.677;

 ll = 0.5*D; // length of the left section
 lr = 3.5*D; // length of the right section
 Include 'ffSphSym.geo';
EndIf
If( Case == 4 )
 l1 = 0.03; // very fine
 l2 = 0.06; // fine
 l3 = 0.09; // coarse

 V = 26.3e-12; // bubble volume in m^3
 deq = 0.747;

 ll = 1.0*D; // length of the left section
 lr = 5.5*D; // length of the right section
 Include 'ffSphSym.geo';
EndIf
If( Case == 5 )
 l1 = 0.04; // very fine
 l2 = 0.07; // fine
 l3 = 0.09; // coarse

 V = 33.9e-12; // bubble volume in m^3
 deq = 0.813;

 ll = 1.0*D; // length of the left section
 lr = 4.5*D; // length of the right section
 Include 'ffSphSym.geo';
EndIf
If( Case == 6 )
 l1 = 0.03; // very fine
 l2 = 0.06; // fine
 l3 = 0.08; // coarse

 V = 72.4e-12; // bubble volume in m^3
 deq = 1.047;

 ll = 1.5*D; // length of the left section
 lr = 4.0*D; // length of the right section
 Include 'ffEloSym.geo';
EndIf
If( Case == 7 )
 l1 = 0.05; // very fine
 l2 = 0.08; // fine
 l3 = 0.1; // coarse

 V = 106.1e-12; // bubble volume in m^3
 deq = 1.189;

 ll = 1.5*D; // length of the left section
 lr = 4.5*D; // length of the right section
 Include 'ffEloSym.geo';
EndIf
If( Case == 18 )
 l1 = 0.05; // very fine
 l2 = 0.08; // fine
 l3 = 0.1; // coarse

 V = 1751e-13; // bubble volume in m^3
 Ddim = 514e-6; // channel diameter in m

 ll = 0.5*D; // length of the left section
 lr = 6.5*D; // length of the right section
 Include 'ffEloSym.geo';
EndIf
