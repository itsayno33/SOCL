#!/usr/bin/bash

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


