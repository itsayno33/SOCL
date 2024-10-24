#!/usr/bin/bash

# 初期化１で実行したinitScript_1.shをルートから削除する
#rm --force /initScript_1.sh

# 初期化時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x   /__InitDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /__InitDir

# ビルド時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x   /BuildDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildDir

# 実行時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
chmod -R a+x  /EntryDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryDir

# その他いろいろ用のフォルダのオーナー変更
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherDir
