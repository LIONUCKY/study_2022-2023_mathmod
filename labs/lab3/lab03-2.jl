#var 50
using Plots
using DifferentialEquations

# эффективность боевых действий со стороны у и x
a = -0.37
c = -0.675
# величины, характеризующие степень влияния различных факторов на потери
b = -0.432
h = -0.42
# P и Q - функцию, отвечающие за возможность подкрепления
function P(t)
    p = abs(2*sin(t))
end

function Q(t)
    q = cos(t) + 2
end
# численность армии страны X
x1 = 61100
# численность армии страны Y
y1 = 45400

u0 = [x1,y1]
T = (0.0,0.0002)
p = (a,b,c,h)

function F(du, u, p, t)
    a,b,c,h = p
    du[1] = a*u[1] + b*u[2] + P(t)
    du[2] = c*u[1]*u[2] + b*u[2] + Q(t)
end

problem = ODEProblem(F, u0, T, p)

sol = solve(problem)

plt = plot(sol, vars=(0,1), color=:green, label="Страна X", title="Модель боевых действий", ylabel="Численность армии")
plot!(sol, vars=(0,2), color=:red, label="Страна Y", xlabel="Время")
savefig(plt, "lab3_2.png")

