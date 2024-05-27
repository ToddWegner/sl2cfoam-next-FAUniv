#! /usr/local/bin/julia

import Pkg

minimalPackages = ["CUDA",
                   "HalfIntegers", 
                   "IJulia",
                   "Libdl", 
                   "LinearAlgebra",
                   "MPI", 
                   "Plots"]

for p in minimalPackages
    Pkg.add("$p")
end
