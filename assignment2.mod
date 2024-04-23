set V1 := {1..6}; 
set V2 := {1..7}; 

param h := 0.06; 
param d {V2};
param q {V1}; 
param g {V1}; 
param fixedcost {V1}; 
param dist {V1,V2}; 
param days := 1461; 

param a {i in V1, j in V2} = dist[i,j]*h*2;  
param c {i in V1, j in V2} = a[i,j]*d[j] + g[i]*d[j] ; 
param f {i in V1} = fixedcost[i]/days; 
var x {V1,V2} >=0;
var y {V1},binary;
 
minimize z: sum{i in V1, j in V2} c[i,j]*x[i,j] + sum{i in V1} f[i]*y[i];

s.t. constrain1 {j in V2}:sum{i in V1} x[i,j]=1;
s.t. constrain2 {i in V1}:sum{j in V2} d[j]*x[i,j]<=q[i]*y[i];
