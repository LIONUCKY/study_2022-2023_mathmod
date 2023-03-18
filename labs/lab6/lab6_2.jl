using Plots
using DifferentialEquations

N = 4289
I0 = 82
R0 = 15
S0 = N - I0 - R0
Ip = 50

a = 0.6
b = 0.4 

u0 = [S0, I0, R0]
T = (0.0, 50.0)

function F!(du, u, p, t)
    if u[2] > Ip
        du[1] = -a*u[1]
        du[2] = a*u[1] - b*u[2]
    else 
        du[1] = 0
        du[2] = -b*u[2]
    end 
    du[3] = b * u[2]
end 

prob = ODEProblem(F!, u0, T)
sol = solve(prob, dtmax=0.2)

S = []
I = []
R = []

TT = sol.t

for u in sol.u
    s, i, r = u
    push!(S, s)
    push!(I, i)
    push!(R, r)
end

plt = plot(dpi = 150, size = (800, 400))

plot!(plt, TT, [S, I, R], color = [:red :blue :brown], xlabel = "time", label = ["S(t)" "I(t)" "R(t)"])
savefig(plt, "img_lab6_jl_2.png")
