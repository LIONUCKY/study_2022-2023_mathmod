using Plots
using DifferentialEquations

#var 50

omega_2 = 1
thetta = 12
f(t) = 2*cos(0.5*t)
tmin = 0
tmax = 51
T = (tmin, tmax)
x0 = 0
y0 = -1.2 
u0 = [x0,y0]

function F!(du, u, p, t)
    du[1] = u[2]
    du[2] = -thetta*u[2] -omega_2*u[1] + f(t)
end

problem = ODEProblem(F!, u0, T)
sol = solve(problem, saveat = 0.05, abstol = 1e-8, reltol = 1e-8)

X = []
Y = []
for u in sol.u
    x, y = u
    push!(X, x)
    push!(Y, y)
end

TT = sol.t 

plt = plot(dpi = 150, layout = (1,2), plot_title = "Модель гармонических колебаний")
plot!(plt[1], TT, [X, Y], color=[ :red :green], xlabel= "Время", label = ["x(t)" "y(t)"])
plot!(plt[2], X, Y, color = [:black], xlabel="x(t)", ylabel="y(t)", label="Фазовый портрет")
savefig(plt, "lab4_3.png")