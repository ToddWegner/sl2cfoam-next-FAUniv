Tested on lubuntu 24.04 LTS (Noble Numbat) 5/27/2024  https://lubuntu.me/downloads/


Hongguang Liu wrote linuxInstallSl2cfoam-next.sh and install_julia.sh in connection to Loop Quantum Gravity Summer School 2024 (Blaumann School for Quantum Gravity) https://indico.cern.ch/event/1231365/overview


Final test run in install_sl2cfoam.sh assumes scripts was run from the home directory.

Run scripts in the following order:

Run one of these scripts:
1 ./linuxInstallSl2cfoam-next.sh         Install qg-cpt-marseille/sl2cfoam-next
  ./linuxInstallSl2cfoam-next-FAUniv     Install Sl2cfoam-next-FAUniv on linux
  ./macInstallSl2cfoam-next-FAUniv.sh    Install Sl2cfoam-next-FAUniv on Mac

2 ./install_julia.sh

3 Either ./install_minimal_julia_packages.sh
  or     ./install_useful_julia_packages.sh
    
4 ./install_jupyter

Launch Jupyter
./launchJupyter.sh
