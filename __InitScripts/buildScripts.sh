#!/usr/bin/bash

# BuildScriptsの実行(フォルダ内のシェルスクリプトを名前順ですべて実行。引数は使用しない)
scripts_dir=/BuildDir
#su "${__SOCL_USER}"
pushd ~ > /dev/null
end_code=0

for scripts in `ls -A -- ${scripts_dir}/*.sh`;
do
        # 拡張子が「.sh」でファイル名として正しくフォルダ内に存在しており
        # 実行権があってファイルサイズが0で無ければ実行
#        if [ -f $scripts ] && [ -e $scripts ] && [ -x $scripts ] && [ -s $scripts ]; then
#            echo "sudo -E -u ${__SOCL_USER} /usr/bin/bash -c source ${scripts}" 1>&2
#            sudo -E -u ${__SOCL_USER} /usr/bin/bash -c source ${scripts}
#            if   [ $? -ne 0 ]; then exit $? ;  fi #スクリプトが異常終了していたら処理打ち切り
#            continue
#        fi
        if [ -f $scripts ] && [ -e $scripts ] && [ -x $scripts ] && [ -s $scripts ]; then
            echo su -E -u "${__SOCL_USER}" /usr/bin/bash "${scripts}" 1>&2
            sudo -E -u "${__SOCL_USER}" /usr/bin/bash ${scripts}
            if   [ $? -ne 0 ]; then
                end_code=$?
                break #スクリプトが異常終了していたら処理打ち切り
            else
                end_code=0
                continue
            fi
        fi
done
popd > /dev/null
