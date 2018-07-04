#!/bin/bash

NEWLIB="$1"

[[ -z "$NEWLIB" ]] && { echo "No LibName"; exit -1; }

mkdir -p ../$NEWLIB

for src in ../template/*; do
    dst="${src//template/$NEWLIB}"
    if [[ -z "${dst##*.link}" ]]; then
        ln -s $src ${dst%.link}
    else
	cp -r $src $dst
    fi
done

[[ -d $NEWLIB ]] && cp $NEWLIB/* ../$NEWLIB/source
