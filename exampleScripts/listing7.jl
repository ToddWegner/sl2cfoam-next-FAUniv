#! /usr/local/bin/julia

# Install your nvidia driver!
# sudo apt install nvidia-driver-535

# This script requires CUDA support, will not run on Intel GPU
# to load from repel: include("listing7.jl")

#using MPI
using SL2CfoamGPU
using SL2Cfoam
using CUDA

#MPI.Init()

# need to do once to configure project
#CUDA.set_runtime_version!(v"12.2")
CUDA.versioninfo()

#1) init SL2Cfoam library
Immirzi = 0.123;
folder="/data/sandbox/devTodd/code/spinFoam/sl2cfoam-next/data_sl2cfoam";
conf = SL2Cfoam.Config(VerbosityOff, NormalAccuracy, 100,0);

SL2Cfoam.cinit(folder, Immirzi, conf);

for J = 2:2:24 
    v = vertex_compute(J * ones(10), 0);
    css = [ coherentstate_compute([J J J J], pi * rand(4,2)) for i in 1:5 ];
    ct  = @elapsed contract(v, css ...)
   
    vg = to_GPU(v);
    cssg = [ to_GPU(cs) for cs in css];
    gt = CUDA.@elapsed contract(vg, cssg...)

    println("ratio of time GPU / CPU for J = $J: $(gt/ct)")
end

#MPI.Finalize()
