using Plots
using DifferentialEquations

a = -0.71
b = 0.046
c = 0.64
d = -0.017

T = (0.0, 50.0)
u0 = [a/b, c/d]

function F!(du, u, p, t)
    du[1] = a*u[1] + b*u[1]*u[2]
    du[2] = c*u[2] + d*u[1]*u[2]
end

prob = ODEProblem(F!, u0, T)
sol = solve(prob, dtmax=0.05)

xx = []
yy = []
tt = sol.t 

for u in sol.u
    x, y = u
    push!(xx, x)
    push!(yy, y)
end

plt = plot(layout=(1,2), dpi =150, size = (800,400), plot_title="Модель хищник-жертва")

plot!(plt[1], tt, [xx, yy], color = [:red :blue], xlabel="time", ylabel = "x(t), y(t)", label = ["число хищников" "число жертв"])
plot!(plt[2], yy, xx, color=:black, xlabel="y(t)", ylabel="x(t)")

savefig(plt, "lab5_2_jl.png")