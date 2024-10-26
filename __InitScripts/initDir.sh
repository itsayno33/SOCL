#!/usr/bin/bash

# 初期化時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
mkdir  -pm 755 /__InitDir
chmod -R a+x   /__InitDir
chown -R root:root /__InitDir

# ビルド時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
mkdir  -pm 755 /BuildDir
chmod -R a+x   /BuildDir
chown -R root:root /BuildDir

# 実行時に必要なスクリプトを置くフォルダへの実行権付与とオーナー変更
mkdir -pm 755 /EntryDir
chmod -R a+x  /EntryDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryDir

# その他いろいろ用のフォルダのオーナー変更
mkdir -pm 777 /OtherDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherDir
