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
    "AdvancedHMC",
    "BenchmarkTools",
    "Conda",
    "CSV",
    "DataFrames",
    "Dates",
    "Debugger",
    "DelimitedFiles",
    "DifferentialEquations",
    "Distributed",
    "Distributions",
    "DynamicHMC",
    "ElasticArrays",
    "ForwardDiff",
    "JLD2",
    "JSON",
    "JupyterFormatter",
    "KahanSummation",
    "LaTeXStrings",
    "LoopVectorization",
    "ParallelDataTransfer",
    "PGFPlotsX",
    "ProgressMeter",
    "PyCall",
    "QuadGK",
    "Random",
    "SharedArrays",
    "StatsBase",
    "StatsPlots",
    "SymEngine",
    "SymPy",
    "Tullio",
    "Turing",
    "WignerSymbols"]

for p in additionalPackages
    Pkg.add("$p")
end

