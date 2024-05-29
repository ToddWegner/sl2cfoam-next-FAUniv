#! /usr/bin/bash

# Original script provided by Hongguang Liu in connection to 
# Loop Quantum Gravity Summer School 2024 (Blaumann School for Quantum Gravity) 
# https://indico.cern.ch/event/1231365/overview
# April 2024 

# script to install sl2cfoam-next into your current directory
FASTWIGXJ_VERSION=1.4.1

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Install OS Dependencies{NC}"
sudo apt update
sudo apt install libmpfr-dev libmpc-dev lzip gcc-12 g++-12 m4 make libquadmath0 libomp-dev libgmp3-dev libgsl-dev libblas-dev libopenblas-dev libopenblas64-dev nvidia-cuda-toolkit gpustat
 
echo -e "${GREEN}Clone qg-cpt-marseille/sl2cfoam-next{NC}" 
git clone https://github.com/qg-cpt-marseille/sl2cfoam-next.git
 
cd sl2cfoam-next/ 

mkdir ext
cd ext
echo -e "${GREEN}Get latest wigxjpf{NC}"
curl -L -O "http://fy.chalmers.se/subatom/wigxjpf/wigxjpf-latest.tar.gz"

echo -e "${GREEN}Get fastwigxj_$FASTWIGXJ_VERSION{NC}"
curl -L -O "http://fy.chalmers.se/subatom/fastwigxj/fastwigxj-$FASTWIGXJ_VERSION.tar.gz"

tar --transform 's/wigxjpf-[0-9.]*/wigxjpf/' -zxf wigxjpf-latest.tar.gz

tar --transform 's/fastwigxj-[0-9.]*/fastwigxj/' -zxf fastwigxj-$FASTWIGXJ_VERSION.tar.gz

echo -e "${GREEN}Compiling Wigxjpf{NC}"
cd wigxjpf
make CC=gcc-12 CXX=g++-12
cd .. 

echo -e "${GREEN}Compiling Fastwigxj{NC}"
cd fastwigxj 
make CC=gcc-12 CXX=g++-12 
cd .. 

echo -e "${GREEN}Compiling sl2cfoam-next{NC}"
cd  ..
make CC=gcc-12 CXX=g++-12 BLAS=system

echo -e "${GREEN}Generating initial nj data{NC}"
mkdir data_sl2cfoam
cd data_sl2cfoam
../ext/fastwigxj/bin/hash_js --max-E-3j=50 /dev/null ./table_50.3j
../ext/fastwigxj/bin/hash_js --max-E-6j=40 /dev/null ./table_40.6j
cd ..

echo -e "${GREEN}A test run{NC}"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:~/sl2cfoam-next/lib
bin/vertex-amplitude ./data_sl2cfoam 0.1 1,1,1,1,1,1,1,1,1,1 2,2,2,2,2 3
