#!/usr/bin/bash

# 初期化時に必要なスクリプトを置くフォルダの作成
chmod -R a+x   /__InitDir
chown -R root:root /__InitDir

# ビルド時に必要なスクリプトを置くフォルダの作成
chmod -R a+x   /BuildDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildDir

# 実行時に必要なスクリプトを置くフォルダの作成
chmod -R a+x  /EntryDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryDir

# その他いろいろ用のフォルダの作成
chmod    777  /OtherDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherDir


# BuildScriptsの実行(フォルダ内のシェルスクリプトを名前順ですべて実行。引数は使用しない)
scripts_dir=/BuildDir
pushd ~ > /dev/null
for scripts in `ls -A -- ${scripts_dir}/*.sh`;
do
        # 拡張子が「.sh」でファイル名として正しくフォルダ内に存在しており
        # 実行権があってファイルサイズが0で無ければ実行
        if [ -f $scripts ] && [ -e $scripts ] && [ -x $scripts ] && [ -s $scripts ]; then
            echo "sudo -E -u ${__SOCL_USER} source ${scripts_dir}/source ${scripts}"
            "sudo -E -u ${__SOCL_USER} source ${scripts_dir}/${scripts}"
            if   [ $? -ne 0 ]; then exit $? fi #スクリプトが異常終了していたら処理打ち切り
            continue
        fi
done
popd > /dev/null
