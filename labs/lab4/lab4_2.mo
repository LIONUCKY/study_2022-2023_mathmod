model lab4_2
parameter Real omega_2 = 11;
parameter Real thetta = 11;
parameter Real x0 = 0;
parameter Real y0 = -1.2;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y;
der(y) = -thetta*y - omega_2*x;
end lab4_2;