model lab6_1
constant Real a = 0.6;
constant Real b = 0.4;
constant Integer Ip = 300;
constant Integer N = 4289;
Real S(time);
Real I(time);
Real R(time);
initial equation
  I = 82;
  R = 15;
  S = N - R - I;
equation
  if I > Ip then
    der(S) = -a*S;
    der(I) = a*S - b*I;
  else 
    der(S) = 0;
    der(I) = -b*I;
  end if;
  
  der(R) = b*I;

end lab6_1;