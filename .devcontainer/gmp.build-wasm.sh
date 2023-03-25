#!/bin/bash
set -e
cd /tools/cobol
export CC=clang
export CXX=clang++

rm -rf gmp-6.2.1
tar xvf gmp-6.2.1.tar.xz

cd gmp-6.2.1
emconfigure ./configure --disable-assembly --host none --prefix=${HOME}/opt
make
make install
