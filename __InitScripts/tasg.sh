#!/usr/bin/bash

if [$# -lt 5]; then
# docker container run イメージ名 のみなら本命引数は空集合とする
    TARG=()
else
# 本命引数(and/or dockerのオプション)が残っているので真面目に処理する
    TARG=($@)

# docker container run の単語3つをスキップ
    TARG=(${TARG[@]:3})

# 先頭が「-」で始まる文字列はdockerのオプションなのでスキップ
    while ["${TARG[0]:0:1}" = "-"];
    do
        TARG=(${TARG[@]:1})
    done

# 次の単語はイメージ名なのでスキップ
    TARG=(${TARG[@]:1})
fi

# 残りを本命の引数としてスクリプトに渡す
echo "sudo -Eu \"${$__SOCL_USER}\" /usr/bin/bash source /__InitScripts/runScripts.sh ONCE \"${TARG[*]}\""
sudo -Eu "${$__SOCL_USER}" /usr/bin/bash source /__InitScripts/runScripts.sh ONCE "${TARG[*]}"
exit $?
