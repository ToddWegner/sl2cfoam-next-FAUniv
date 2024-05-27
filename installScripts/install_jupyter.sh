#! /usr/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

cd ~

echo -e "${GREEN}Install python3-pip${NC}"
sudo apt install python3-pip

echo -e "${GREEN}Install python3-venv${NC}"
sudo apt install python3-venv

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
jt -t oceans16

echo -e "${GREEN}Done.${NC}"
