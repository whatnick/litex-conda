#!/bin/bash

set -x
set -e

lm32-elf-as --version

rm -rf libstdc++-v3
mkdir build
cd build
../configure \
        --prefix=$PREFIX \
        --with-gmp=$PREFIX \
        --with-mpfr=$PREFIX \
        --with-mpc=$PREFIX \
        --with-isl=$PREFIX \
        --with-cloog=$PREFIX \
	--target=lm32-elf \
	--enable-languages="c,c++" \
	--disable-libgcc \
	--disable-libssp

make -j$CPU_COUNT
make install-strip
TZ=UTC date +%Y%m%d_%H%M%S > ../__conda_buildstr__.txt
TZ=UTC date +%Y%m%d%H%M%S > ../__conda_buildnum__.txt
