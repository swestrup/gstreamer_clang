#!/bin/bash 
#  Bash file to cross compile for Android

PRJ_DIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"

source "${PRJ_DIR}/build.cfg"

# Note: First two invocations of make produce and install the dynamic
# libraries. The second two produce and install the static libraries and
# various tools.

rm -vf ${LIB_DIR}/libbz2*
cd ${PRJ_SRC_FULL}						\
&& make								\
&& make install PREFIX="${PREFIX_DIR}"				\

# these build the shared libs, which I don't think we use	
exit	
&& make	-f ${MFILE}						\
&& make -f ${MFILE} install PREFIX="${PREFIX_DIR}"		\
&& (cd ${LIB_DIR} && ln -vs libbz2.so.1.0.* libbz2.so)   	\
