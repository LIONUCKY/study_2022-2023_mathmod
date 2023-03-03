model lab4_3
parameter Real omega_2 = 1;
parameter Real thetta = 12;
parameter Real x0 = 0;
parameter Real y0 = -1.2;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y;
der(y) = -thetta*y - omega_2*x + 2*cos(0.5*time);
end lab4_3;