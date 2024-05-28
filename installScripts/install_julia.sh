# Original script provided by Hongguang Liu in connection to 
# Loop Quantum Gravity Summer School 2024 (Blaumann School for Quantum Gravity) 
# https://indico.cern.ch/event/1231365/overview
# April 2024 

GREEN='\033[0;32m'
NC='\033[0m' # No Color

cd ~

JULIA_VERSION=1.10
JULIA_SUB_VERSION=3
ARCH=x86_64

echo -e "${GREEN}Get julia-$JULIA_VERSION{NC}"

curl -L -O "https://julialang-s3.julialang.org/bin/linux/x64/$JULIA_VERSION/julia-$JULIA_VERSION.$JULIA_SUB_VERSION-linux-$ARCH.tar.gz"
tar -zvxf julia-$JULIA_VERSION.$JULIA_SUB_VERSION-linux-$ARCH.tar.gz

cd julia-$JULIA_VERSION.$JULIA_SUB_VERSION
rm -rf lib/julia/libmpfr.so lib/julia/libmpfr.so.6
ln -s /usr/lib/x86_64-linux-gnu/libmpfr.so.6 lib/julia/libmpfr.so.6
ln -s /usr/lib/x86_64-linux-gnu/libmpfr.so lib/julia/libmpfr.so

sudo ln -s ~/julia-$JULIA_VERSION.$JULIA_SUB_VERSION/bin/julia /usr/local/bin/julia

julia install_minimal_julia_packages.js

