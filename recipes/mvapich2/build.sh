#!/bin/bash

set -ex

unset F77 F90

#export CC=${CC:-gcc}
#export CXX=${CXX:-g++}
#export FC=${FC:-gfortran}

./configure --prefix=$PREFIX \
            --enable-fast=none \
            --enable-g=all \
            --with-device=ch4:ofi \
            --with-hwloc-prefix=$PREFIX \
            --with-rdma=$PREFIX \
            --enable-fortran=all \
            --enable-romio \
            --enable-rdma-cm \
            --enable-nemesis-shm-collectives \
            --disable-gl \
            --disable-nvml \
            --disable-cl \
            --disable-opencl \
	    --disable-dependency-tracking \
	    --with-sysroot

make -j"${CPU_COUNT:-1}"
make install
