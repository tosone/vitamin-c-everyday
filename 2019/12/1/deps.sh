#!/bin/bash

set -ex

libuuid_version=1.0.3
current_dir=${PWD}

if [ -d build ]; then
  rm -rf build
fi

mkdir build

tar zxvf libuuid-${libuuid_version}.tar.gz
cd libuuid-${libuuid_version}
./configure --prefix=${current_dir}/build
make && make install
