#!/bin/bash 
#  Bash file to cross compile for Android

PRJ_DIR="$(dirname $(realpath ${BASH_SOURCE[0]}))"

source "${PRJ_DIR}/build.cfg"

cd ${PRJ_SRC_FULL}				\
&& ./autogen.sh --noconfigure                   \
&& ${CONFIG}					\
&& make						\
&& make install

