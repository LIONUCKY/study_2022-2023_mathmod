model lab7_1
  constant Real alfa1 = 0.66;
  constant Real alfa2 = 0.00006;
  constant Integer N = 2010;
  constant Integer n0 = 29;
  Real n(time);
initial equation
  n = n0;
equation
  der(n) = (alfa1 + alfa2*n)*(N-n);
end lab7_1;