#!/usr/bin/bash

# BuildScriptsの実行(フォルダ内のシェルスクリプトを名前順ですべて実行。引数は使用しない)
scripts_dir=/BuildDir
for scripts in `ls -A -- ${scripts_dir}/ | grep \.sh$`;
do
        if [ -f ${scripts_dir}/$scripts ] && [ -e ${scripts_dir}/$scripts ] && [ -x ${scripts_dir}/$scripts ] && [ -s ${scripts_dir}/$scripts ]; then
            echo "sudo -E -u ${__SOCL_USER} /usr/bin/bash ${scripts_dir}/${scripts}" 1>&2
            sudo -E -u "${__SOCL_USER}" /usr/bin/bash ${scripts_dir}/${scripts} 1>&2
            if   [ $? -ne 0 ]; then
                break #スクリプトが異常終了していたら処理打ち切り
            else
                continue
            fi
        fi
done
