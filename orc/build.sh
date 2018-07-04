#!/bin/bash 
# Bash file to build local and cross-compilation targets

PRJ_DIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"

#  Build as a local tool
(
source "${PRJ_DIR}/local.cfg"
    
cd ${PRJ_SRC_FULL}
[[ -f Makefile ]]  && make distclean
autoreconf -i -f   &&
${CONFIG}          && 
make               && 
make install
) || exit -1

#  Cross compile for Android
(
source "${PRJ_DIR}/build.cfg"

cd ${PRJ_SRC_FULL} 
[[ -f Makefile ]]  && make distclean
autoreconf -i -f   &&
${CONFIG}          &&
make               &&
make install
)

