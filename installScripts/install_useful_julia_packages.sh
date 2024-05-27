#! /usr/local/bin/julia

import Pkg

minimalPackages = [
    "CUDA",
    "HalfIntegers", 
    "IJulia",
    "Libdl", 
    "LinearAlgebra",
    "MPI", 
    "Plots"]

for p in minimalPackages
    Pkg.add("$p")
end

additionalPackages = [
    "BenchmarkTools",
    "CSV",
    "DataFrames",
    "Dates",
    "Debugger",
    "DelimitedFiles"
    "DifferentialEquations",
    "Distributed",
    "Distributions",
    "ElasticArrays",
    "ForwardDiff",
    "JLD2"
    "JupyterFormatter"
    "KahanSummation"
    "LaTeXStrings",
    "LoopVectorization",
    "ParallelDataTransfer"
    "PGFPlotsX",
    "ProgressMeter"
    "PyCall"
    "QuadGK",
    "Random",
    "SharedArrays",
    "StatsBase"
    "StatsPlots"
    "SymEngine"
    "SymPy"
    "Tullio"
    "WignerSymbols")

for p in additionalPackages
    Pkg.add("$p")
end

