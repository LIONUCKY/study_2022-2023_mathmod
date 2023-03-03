model lab4_1
parameter Real omega_2 = 3.5;
parameter Real x0 = 0;
parameter Real y0 = -1.2;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y;
der(y) = -omega_2*x;
end lab4_1;