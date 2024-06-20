sl2cfoam.ipynb                Notebook from Hongguang Liu https://indico.cern.ch/event/1231365/overview
Run from Jupyter.

./runJulia.sh listing1.jl     How-To compute EPRL spin foam amplitudes, Pietro Dona, Pietropaolo Frisoni  https://arxiv.org/abs/2202.04360

./runJulia.sh listing7.jl     How-To compute EPRL spin foam amplitudes, Pietro Dona, Pietropaolo Frisoni  https://arxiv.org/abs/2202.04360
Need to install your nividia driver.
Example: sudo apt install nvidia-driver-535

If you get an error similar to:
Error: CUDA.jl could not find an appropriate CUDA runtime to use.
It maybe that the nividia driver was not install at the time the julia CUDA package was install.
Then do this:

julia
import Pkg
Pkg.build("CUDA")

