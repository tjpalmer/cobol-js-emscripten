#!/bin/bash
set -e
cd /tools/cobol
export CC=clang
export CXX=clang++

rm -rf gnucobol-3.1.2
tar xvf gnucobol-3.1.2.tar.xz

cd gnucobol-3.1.2
./configure --with-db=false --disable-assembly
make install
ldconfig
