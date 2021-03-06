#!/bin/bash 
#  Bash file to cross compile for Android

PRJ_DIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"

source "${PRJ_DIR}/build.cfg"

cd ${PRJ_SRC_FULL}				
[[ -f Makefile ]]  && make distclean
${CONFIG}					\
&& make						\
&& make install
