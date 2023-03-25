using Plots
using DifferentialEquations

alfa1 = 0.66
alfa2 = 0.00006

N = 2010
u0 = [29]

T = (0.0, 10.0)

function F!(du, u, p, t)
    du[1] = (alfa1 +  alfa2 * u[1])*(N - u[1])
end

function F1!(du, u, p, t)
    du[1] = (alfa1 * t +  alfa2 * t * u[1])*(N - u[1])
end

prob_1 = ODEProblem(F!, u0, T)
sol_1 = solve(prob_1)

plt_1 = plot(sol_1, dpi = 150, size = (800, 400), xlabel = "time", ylabel = "n(t)")
savefig(plt_1, "img_lab_6_1_jl.png")

alfa1 = 0.00006
alfa2 = 0.6
T1 = (0.0, 0.01)

prob_2 = ODEProblem(F!, u0, T1)
sol_2 = solve(prob_2)

plt_2 = plot(sol_2, dpi = 150, size = (800, 400), xlabel = "time", ylabel = "n(t)")
savefig(plt_2, "img_lab_6_2_jl.png")

alfa1 = 0.66
alfa2 = 0.6
T2 = (0.0, 0.2)

prob_3 = ODEProblem(F1!, u0, T2)
sol_3 = solve(prob_3)

plt_3 = plot(sol_3, dpi = 150, size = (800, 400), xlabel = "time", ylabel = "n(t)")
savefig(plt_3, "img_lab_6_3_jl.png")