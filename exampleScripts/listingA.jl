# A high-performance code for EPRL spin foam amplitudes - Francesco Gozzini

using SL2Cfoam
using HalfIntegers

# init SL2Cfoam library
Immirzi = 0.123;
folder = "../data_sl2cfoam";
conf = SL2Cfoam.Config(VerbosityOff, NormalAccuracy, 100, 0);