#var 50
using Plots
using DifferentialEquations

# эффективность боевых действий со стороны у и x
a = -0.41
c = -0.52
# величины, характеризующие степень влияния различных факторов на потери
b = -0.89
h = -0.61
# P и Q - функцию, отвечающие за возможность подкрепления
#P(t) = sin(t+7) + 1
#Q(t) = cos(t+6) + 1
function P(t)
    p = sin(t+7) + 1
end

function Q(t)
    q = cos(t+6) + 1
end
# численность армии страны X
x1 = 61100
# численность армии страны Y
y1 = 45400

u0 = [x1,y1]
T = (0.0,1.5)
p = (a,b,c,h)

function F(du, u, p, t)
    a,b,c,h = p
    du[1] = a*u[1] + b*u[2] + P(t)
    du[2] = c*u[1] + b*u[2] + Q(t)
end

problem = ODEProblem(F, u0, T, p)

sol = solve(problem)

plt = plot(sol, vars=(0,1), color=:green, label="Страна X", title="Модель боевых действий", ylabel="Численность армии")
plot!(sol, vars=(0,2), color=:red, label="Страна Y", xlabel="Время")
savefig(plt, "lab3_1.png")

