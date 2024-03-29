using Plots
using DifferentialEquations

x0 = 6
y0 = 14

a = 0.61
b = 0.41
c = 0.051
d = 0.031


function ode_fn(du, u, p, t)
    x, y = u
    du[1] = -a*u[1] + c * u[1] * u[2]
    du[2] = b * u[2] - d * u[1] * u[2]
end

v0 = [x0, y0]
tspan = (0.0, 60.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax=0.05)
X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(
  dpi=300,
  legend=false)

plot!(
  plt,
  X,
  Y,
  label="Зависимость численности хищников от численности жертв",
  color=:blue)

savefig(plt, "julia1-1.png")

plt2 = plot(
  dpi=300,
  legend=true)

plot!(
  plt2,
  T,
  X,
  label="Численность жертв",
  color=:green)

plot!(
  plt2,
  T,
  Y,
  label="Численность хищников",
  color=:red)

savefig(plt2, "julia1-2.png")