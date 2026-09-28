# Quantum ESPRESSO Reproducible Installer

A reproducible installation script for building **Quantum ESPRESSO** on F1 cluster.
Compiler and MPI environments are provided by the user before running the script.

## Requirements

The loaded environment must provide at least:

```text
git
make
MPI C compiler
MPI Fortran compiler
```

BLAS, LAPACK, MPI, and other available numerical libraries are detected by the Quantum ESPRESSO configure system.

## Installation

```bash
git clone https://github.com/Choconie-Ning/Infra-Basic-HW-2-QE.git
./Infra-Basic-HW-2-QE/install.sh
```

The script installs Quantum ESPRESSO into:`install/qe-7.6/`.

## Toolchain 

Load a compiler and MPI environment before running `install.sh`.

For example, Intel oneAPI and Intel MPI on NCHC F1:

```bash
module purge
module load intel/2024_01_46

CC=mpiicx MPIF90=mpiifx ./install.sh
```

GCC + OpenMPI:

```bash
module purge
module load gcc/11.2.0
module load openmpi/4.1.6

CC=mpicc MPIF90=mpif90 ./install.sh
```

## Options

```
QE_VERSION       Quantum ESPRESSO version, default: 7.6
CC               MPI C compiler, default: mpicc
MPIF90           MPI Fortran compiler, default: mpif90
JOBS             Number of parallel build jobs, default: 4
INSTALL_DIR      Installation prefix
CONFIGURE_FLAGS  Additional Quantum ESPRESSO configure options
```

e.g.`JOBS=16 CONFIGURE_FLAGS="--enable-openmp" ./install.sh`



