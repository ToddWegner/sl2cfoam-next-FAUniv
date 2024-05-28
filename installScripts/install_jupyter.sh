#! /usr/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

cd ~

echo -e "${GREEN}Install python3-pip${NC}"
sudo apt install python3-pip

echo -e "${GREEN}Install python3-venv${NC}"
sudo apt install python3-venv

echo -e "${GREEN}Install at system level ${NC}"
sudo apt install python3-sympy

echo -e "${GREEN}Activate local Python environment${NC}"
python3 -m venv .venv
source .venv/bin/activate

echo -e "${GREEN}Install jupyterlab${NC}"
python3 -m pip install jupyterlab

echo -e "${GREEN}Install notebook${NC}"
python3 -m pip install notebook

echo -e "${GREEN}Install jupyterthemes${NC}"
python3 -m pip install jupyterthemes

echo -e "${GREEN}Set Jupyter Themes${NC}"
# onedork
# grade3
# oceans16
# chesterish

#jt -t oceans16

read -p "Install optional python packages locally (symply, numpy, symengine, pandas) (y/n) ? " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    python3 -m pip install sympy
    python3 -m pip install numpy
    python3 -m pip install symengine
    python3 -m pip install pandas    
fi

echo
echo -e "${GREEN}Done.${NC}"
