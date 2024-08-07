#!/bin/sh
# Tell omniidl to use python back-end
export PYTHONPATH=$PREFIX/lib/python$PY_VER/site-packages/:$PREFIX/lib/python$PY_VER/site-packages/omniidl_be/

mkdir build
cd build
cmake ${CMAKE_ARGS} .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DPYTHON_SITELIB=$PREFIX/lib/python$PY_VER/site-packages \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_UNIT_TESTS=OFF
make -j${CPU_COUNT}
make install
