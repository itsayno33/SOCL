#!/usr/bin/bash 

declare -a TARG
for arg; do
    TARG=( "${TARG[@]}" $arg )
done
echo "called: ${TARG[1]}"

