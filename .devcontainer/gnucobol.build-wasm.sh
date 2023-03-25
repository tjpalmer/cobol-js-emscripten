#!/bin/bash
set -e
cd /tools/cobol
export CC=clang
export CXX=clang++

rm -rf gnucobol-3.1.2
tar -xvf gnucobol-3.1.2.tar.xz

cd gnucobol-3.1.2

autoreconf -f -i

GMP_CFLAGS="-I/root/opt/include -L/root/opt/lib" \
    emconfigure ./configure --with-db=false --disable-assembly \
    --prefix=${HOME}/opt --includedir=${HOME}/opt/include
cd libcob
emmake make INCLUDES=-I/root/opt/include CFLAGS=-L/root/opt/lib
make install
