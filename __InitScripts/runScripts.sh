#!/usr/bin/bash

# 引数モードのスペルを大文字化して保存
run_mode=${2^^}

if [$# -lt 2]; then
# コマンドとスクリプト名とモードで3以上になるはず
    exit 1
else if [$# -lt 3]; then
# source runScript.sh モード だけなら引数なし
    RUNARG=()
else
# source runScript.sh モード まで読み飛ばして引数化
    RUNARG="$@[@]"
    RUNARG=("${RUNAGE[*]:3}")
fi

# 引数モードが規定外なら異常終了
if [ $run_mode != "ALL" ] && [ $run_mode != "ONCE" ]; then exit 1 fi

# カレントフォルダ内のシェルスクリプトに上記の引数を付けて実行
for scripts in `ls -AB *.sh`
do
    pushd ~ > /dev/null
        # 拡張子が「.sh」でファイル名として正しくフォルダ内に存在しており
        # 実行権があってファイルサイズが0で無ければ実行
        if [ -f $scripts ] && [ -e $scripts ] && [ -x $scripts ] && [ -s $scripts ]; then
            echo "$scripts $RUNARG"
            source "./${scripts} $RUNARG"
            if   [ $? -ne 0 ]; then exit $? #スクリプトが異常終了していたら処理打ち切り
            elif [ $run_mode = "ALL"  ]; then continue
            elif [ $run_mode = "ONCE" ]; then break
            else exit 2 fi
        fi
    popd > /dev/null
done
