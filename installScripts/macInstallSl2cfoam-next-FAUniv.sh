#! /usr/bin/bash

# Original script provided by Hongguang Liu in connection to 
# Loop Quantum Gravity Summer School 2024 (Blaumann School for Quantum Gravity) 
# https://indico.cern.ch/event/1231365/overview
# April 2024 

# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#brew install 
# ln -s gcc-12 gcc and ln -s g++-12 g++
# export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"

# script to install sl2cfoam-next into your current directory

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Install OS Dependencies{NC}"
sudo apt update
brew install mpfr mpc lzip gcc@12 make openblas
 
echo -e "${GREEN}Clone sl2cfoam-next-FAUniv{NC}" 
git clone https://github.com/FAUniv/sl2cfoam-next-FAUniv.git
 
cd sl2cfoam-next-FAUniv/ 

echo -e "${GREEN}Compiling sl2cfoam-next{NC}"
make CC=gcc-12 CXX=g++-12 BLAS=system

echo -e "${GREEN}Generating initial nj data{NC}"
mkdir data_sl2cfoam
cd data_sl2cfoam
../src/fastwigxj-1.4.1-no-x86/bin/hash_js --max-E-3j=50 /dev/null ./table_50.3j
../src/fastwigxj-1.4.1-no-x86/bin/hash_js --max-E-6j=40 /dev/null ./table_40.6j
cd ..

echo -e "${GREEN}A test run{NC}"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:./lib
bin/vertex-amplitude ./data_sl2cfoam 0.1 1,1,1,1,1,1,1,1,1,1 2,2,2,2,2 3
