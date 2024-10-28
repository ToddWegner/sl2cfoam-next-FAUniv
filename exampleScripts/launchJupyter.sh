#! /usr/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:./sl2cfoam-next/lib
export JULIA_LOAD_PATH="./sl2cfoam-next/julia/:$JULIA_LOAD_PATH"
source ~/.venv/bin/activate
jupyter notebook
