#!/usr/bin/bash

if [ $# -lt 1 ]; then
# docker container run サービス名 のみなら本命引数は空集合とする
    TARG=()
else
# 本命引数(and/or dockerのオプション)が残っているのでTARGに保存する
    for arg; do
        TARG=( "${TARG[@]}" $arg )
    done
fi

# TARGを本命の引数としてスクリプトに渡す
echo "sudo -Eu \"${$__SOCL_USER:=pee}\" /usr/bin/bash cd \"${__SOCL_EntryScript}\" && source /__InitScripts/runScripts.sh ONCE \"${TARG[@]}\""
sudo -Eu "${$__SOCL_USER:=pee}" /usr/bin/bash cd /EntryScript && source /__InitScripts/runScripts.sh ONCE "${TARG[@]}"
exit $?
