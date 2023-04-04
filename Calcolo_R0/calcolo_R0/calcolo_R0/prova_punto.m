syms x y lamda
eqn1= 2*x+lamda*y==0;
eqn2= 3*(x+y+x*y)==0;
eqn = [eqn1 eqn2];
solution = solve(eqn,[x y]);
solution.x
