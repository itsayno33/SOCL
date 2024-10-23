#!/usr/bin/bash

# 初期化１で実行したinitScript_1.shをルートから削除する
#rm --force /initScript_1.sh

# 初期化時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x   /InitScripts
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /InitScripts

# ビルド時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x   /BuildScripts
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildScripts

# 実行時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x  /EntryScript
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryScript

# その他いろいろ用のフォルダのオーナー変更
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherData
