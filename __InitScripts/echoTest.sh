#!/usr/bin/bash 

#declare -a TARG=( )
#for arg; do
#    TARG=( "${TARG[@]}" $arg )
#done
IFS='|'
echo "called: ${TARG[*]}" 1>&2

