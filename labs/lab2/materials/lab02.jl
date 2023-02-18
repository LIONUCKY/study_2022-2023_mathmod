#библиотеки
using Plots
using DifferentialEquations
#variant 50
# Vк = 4.7 * Vл =>   t = r0/Vл = (a-r0)/4.7 * Vл =>     r0 = (a-r0)/4.7 =>      5.7 * r0 = a =>     r0 = a/5.7
# Vк = 4.7 * Vл =>   t = r0/Vл = (a+r0)/4.7 * Vл =>     r0 = (a+r0)/4.7 =>      3.7 * r0 = a =>     r0 = a/3.7

# расстояние от лодки до катера
const a = 16.9
# Vк/Vл
const n = 4.7
# расстояние начала спирали
const r0 = a/(n + 1)
const r0_2 = a/(n - 1)
# интервал
const T = (0, 2*pi)
const T_2 = (-pi, pi)

# Vк^2 = Vr^2 + Vt^2 =>    n^2 * Vl^2 = Vr^2 + Vt^2 =>   Vt^2 = Vl^2/(n^2 - 1)
function F(u, p, t)
    return u / sqrt(n*n - 1)
end

# задача ОДУ
problem = ODEProblem(F, r0, T)

#решение 
result = solve(problem, abstol=1e-8, reltol=1e-8)
@show result.u
@show result.t

dxR = rand(1:size(result.t)[1])
rAngles = [result.t[dxR] for i in 1:size(result.t)[1]]

#холст1
plt = plot(proj=:polar, aspect_ratio=:equal, dpi = 1200, legend=true, bg=:white)

#параметры для холста
plot!(plt, xlabel="theta", ylabel="r(t)", title="Кривая погони", legend=:outerbottom)

plot!(plt, [0.0,0.0], [a, r0], label = "Начальное движение", color=:green, lw=0.2)
scatter!(plt, [0.0], [a], label="", mc=:green, ms=0.2)

plot!(plt, [rAngles[1], rAngles[2]], [0.0, result.u[size(result.u)[1]]], label="Путь лодки", color=:blue, lw=0.2)
scatter!(plt, rAngles, result.u, label="", mc=:blue, ms=0.005)

plot!(plt, result.t, result.u, xlabel="theta", ylabel="r(t)", label="Путь катера", color=:red, lw=0.2)
scatter!(plt, result.t, result.u, label="", mc=:red, ms=0.005)

savefig(plt, "lab02-01.png")


problem = ODEProblem(F, r0_2 , T_2)
result = solve(problem, abstol=1e-8, reltol=1e-8)
dxR = rand(1:size(result.t)[1])
rAngles = [result.t[dxR] for i in 1:size(result.t)[1]]

#xoлст2
plt1 = plot(proj=:polar, aspect_ratio=:equal, dpi = 1200, legend=true, bg=:white)

#параметры для холста
plot!(plt1, xlabel="theta", ylabel="r(t)", title="Кривая погони", legend=:outerbottom)

plot!(plt1, [0.0,0.0], [a, r0], label = "Начальное движение", color=:green, lw=0.2)
scatter!(plt1, [0.0], [a], label="", mc=:green, ms=0.2)

plot!(plt1, [rAngles[1], rAngles[2]], [0.0, result.u[size(result.u)[1]]], label="Путь лодки", color=:blue, lw=0.2)
scatter!(plt1, rAngles, result.u, label="", mc=:blue, ms=0.005)

plot!(plt1, result.t, result.u, xlabel="theta", ylabel="r(t)", label="Путь катера", color=:red, lw=0.2)
scatter!(plt1, result.t, result.u, label="", mc=:red, ms=0.005)

savefig(plt1, "lab02-02.png")




