using Plots;
using DifferentialEquations;

const M1_0 = 6.4 * 1e6
const M2_0 = 4.1 * 1e6
const p_cr = 20 * 1e3
const N = 40 * 1e3
const q = 1
const tau1 = 20
const tau2 = 15
const p1 = 7 * 1e3 
const p2 = 9.5 * 1e3

const a1 = p_cr / (tau1 ^ 2 * p1 ^ 2 * N * q)
const a2 = p_cr / (tau2 ^ 2 * p2 ^ 2 * N * q)
const b = p_cr / (tau1 ^ 2 * p1 ^ 2 * tau2 ^ 2 * p2 ^ 2 * N * q)
const c1 = (p_cr - p1)/ (tau1 * p1)
const c2 = (p_cr - p2)/ (tau2 * p2)

u0 = [M1_0, M2_0]
T = (0.0, 200 * c1)

function F!(du, u, p, t)
    du[1] = u[1] - (b/c1)*u[1]*u[2] - (a1/c1)*u[1]^2
    du[2] = (c2/c1)*u[2] - (b/c1)*u[1]*u[2] - (a2/c1)*u[2]^2
end 

prob = ODEProblem(F!, u0, T)
sol = solve(prob)
plt = plot(sol, dpi =150, size = (800, 400), xlabel = "t/c1", label = ["M1" "M2"])
savefig(plt, "img_lab8_1.png")