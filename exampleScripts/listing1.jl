#! /usr/local/bin/julia

# to load from repel: include("listing1.jl")

# cd /data/sandbox/devTodd/code/spinFoam/sl2cfoam-next
# ./julia.sh
# include("listing1.jl")

using SL2Cfoam
using HalfIntegers

print("PID: ", getpid(), "\n")

#=
using MPI
MPI.Init()
rank = MPI.Comm_rank(MPI.COMM_WORLD)
size = MPI.Comm_size(MPI.COMM_WORLD)
println("Hello from process ", rank, " of ", size)
=#

#1) init SL2Cfoam library
Immirzi = 0.123;
folder="../data_sl2cfoam";
conf = SL2Cfoam.Config(VerbosityOff, NormalAccuracy, 100,0);

SL2Cfoam.cinit(folder, Immirzi, conf);

#2) Computation of a vertex sensor
spins =[2 2 2 2 2 2 2 2 2 2]
shells = 1
v = vertex_compute(spins, shells);
# show the amplitude with intertwiners (0,0,0,0,0)
# v.a is the array with the data
@show v.a[1,1,1,1,1];

#3) Computation of a coherent amplitude with random angles
# define the 4 spins tht enter the coherent state
js_intw = [2 2 2 2]

# compute the coherent states with random angles in (0, pi)
# angles are 4x2 matrices (theta, phi) [ 2 angles per 4 normals ]
cs1 = coherentstate_compute(js_intw, pi * rand(4,2));
cs2 = coherentstate_compute(js_intw, pi * rand(4,2));
cs3 = coherentstate_compute(js_intw, pi * rand(4,2));
cs4 = coherentstate_compute(js_intw, pi * rand(4,2));
cs5 = coherentstate_compute(js_intw, pi * rand(4,2));

# contract the vetex with the coherent states (notice the order)
contract(v, cs5, cs4, cs3, cs2, cs1)

#4) Simple asymptotics
# compute vertices
# all boundary spins set to λ (Euclidean boundary configuration)
@time vs = [ vertex_compute(λ * ones(10), 1) for λ in 1:10 ]

#compute and contract with random coherent states
ampls = ComplexF64[]
for λ = 1:10
    css = [coherentstate_compute(λ * ones(HalfInt, 4), pi * rand(4,2)) for i in 1:5]
    ampl = contract(vs[λ], css ...)
    push!(ampls, ampl)
end

# logplot of absolute value of the coherent amplitudes
using Plots
plot(1:10, abs.(ampls), yaxis=:log, shape=:circle, title="Simple asymptotics (suppressed).")

# 5) Boosters benchmark
for K = 1:15
    t = @elapsed b4_compute(K .* [10 10 10 10], K .* [10 10 10 10])
    println("time for K = $K : $t")
end

#=
# 6) Vertex benchmark
# this tells the function vertex_compute that for this benchmark
# we don't need the resulting tensor nor to store it
benchres = SL2Cfoam.VertexResult((false, false, false))

for shells = 0:16
    t = @elapsed vertex_compute(ones(Int, 10), shells; result = benchres)
    println("time for shells = $shells : $t")
end    
=#

# Listing 8: Lorentzian asymptotics

# vertex boundary spins
js = [5 5 5 5 2 2 2 2 2 2];

# spins along the strands of the edges 5,4,3,2,1
jcs = [[5 2 2 2], [2 5 2 2], [2 2 5 2], [2 2 2 5], [5 5 5 5]];

# angles for the boundry coherent states

#MPI.Finalize()
