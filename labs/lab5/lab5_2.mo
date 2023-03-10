model lab5_2
parameter Real a = -0.71;
parameter Real b = 0.046;
parameter Real c = 0.64;
parameter Real d = -0.017;
Real x(start=a/b);
Real y(start=c/d);
equation
der(x) = a*x + b*x*y;
der(y) = c*y + d*x*y;
end lab5_2;