using Plots
using DifferentialEquations

# distance between coastguard boat and smuggler's boat
const s = 20.3
const n = 5.2

#distance from the spiral beginning
const r01 = s/(n+1)
const r02 = s/(n-1)

const I1 = (-1, 3*pi)
const I2 = (-pi, pi)

function F(u,p,t)
	return u / sqrt(n*n -1)
end

#diff equation and it's solution
problem = ODEProblem(F,r01,I1)

res = solve(problem, abstol=1e-8,reltol=1e-8)
@show res.u
@show res.t

dxR = rand(1:size(res.t)[1])
rAng = [res.t[dxR] for i in 1:size(res.t)[1]]

#canvas1
plt = plot(proj=:polar, aspect_ratio =:equal, dpi = 1000, legend=true,bg=:white)
plot!(plt,xlabel="theta",ylabel="r(t)",title="Chase task - case 1", legend=:outerbottom)
plot!(plt,[rAng[1],rAng[2]], [0.0,res.u[size(res.u)[1]]],label="smuggler's boat trajectory", color=:blue,lw = 1)
scatter!(plt,rAng,res.u,label = "",mc=:blue,ms=0.0005)
plot!(plt,res.t,res.u,xlabel = "theta", ylabel = "r(t)", label = "coastguard boat trajectory", colot=:green, lw = 1 )
scatter!(plt,res.t,res.u,label="",mc=:green, ms=0.0005)

savefig(plt, "lab02_01.png")

problem = ODEProblem(F,r02,I2)
res = solve(problem, abstol=1e-8,reltol=1e-8)
dxR = rand(1:size(res.t)[1])
rAng = [res.t[dxR] for i in 1:size(res.t)[1]]

#canvas2
plt2 = plot(proj=:polar, aspect_ratio =:equal, dpi = 1000, legend=true,bg=:white)
plot!(plt2,xlabel="theta",ylabel="r(t)",title="Chase task - case 1", legend=:outerbottom)
plot!(plt2,[rAng[1],rAng[2]], [0.0,res.u[size(res.u)[1]]],label="smuggler's boat trajectory", color=:blue,lw = 1)
scatter!(plt2,rAng,res.u,label = "",mc=:blue,ms=0.0005)
plot!(plt2,res.t,res.u,xlabel = "theta", ylabel = "r(t)", label = "coastguard boat trajectory", colot=:green, lw = 1 )
scatter!(plt2,res.t,res.u,label="",mc=:green, ms=0.0005)

savefig(plt2, "lab02_02.png")