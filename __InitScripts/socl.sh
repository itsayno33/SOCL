#!/usr/bin/bash

# 引数を$TARGに退避
declare -a TARG=( )
for arg; do
    TARG=( "${TARG[@]}" $arg )
done

# ユーザー・グループの作成。各種フォルダの(実行)権限・オーナーの初期化(ビルド後の初回実行時のみ)
source /__InitDir/initScript_2.sh

if [ ! -f /__InitDir/tmp/build_ok ]; then
    # ビルド用スクリプトの実行(ビルド後の初回実行時のみ)
    source /__InitDir/buildScripts.sh
    if   [ $? -eq 0 ]; then touch /__InitDir/tmp/build_ok ;  fi #ビルドに成功していたらフラグを立てる
fi


# EntryScriptsの実行(フォルダ内のシェルスクリプトを名前順で検索して最後のスクリプトだけを実行。引数も使用する)
scripts_dir=/EntryDir

for scripts in `ls -Ar -- ${scripts_dir}/ | grep \.sh$`;
do
        if [ -f ${scripts_dir}/$scripts ] && [ -e ${scripts_dir}/$scripts ] && [ -x ${scripts_dir}/$scripts ] && [ -s ${scripts_dir}/$scripts ]; then
            echo "sudo -E -u ${__SOCL_USER} /usr/bin/bash ${scripts_dir}/${scripts} ${TARG[@]}" 1>&2
            sudo -E -u "${__SOCL_USER}" /usr/bin/bash ${scripts_dir}/${scripts} "${TARG[@]}" 1>&2
            break;
        fi
done



# Test用エントリーポイント
#source /__InitDir/echoTest.sh
#usr/bin/bash -i
