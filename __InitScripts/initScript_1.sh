#!/usr/bin/bash

# 必要なパッケージの取得(処理に時間がかかるのでテスト終了までコメントアウト)
apt-get update
apt-get install -y sudo

# 初期化時に必要なスクリプトを置くフォルダの作成
mkdir  -pm 755 /__InitDir
chmod -R a+x   /__InitDir
chown -R root:root /__InitDir

# ビルド時に必要なスクリプトを置くフォルダの作成
mkdir  -pm 755 /BuildDir
chmod -R a+x   /BuildDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildDir

# 実行時に必要なスクリプトを置くフォルダの作成
mkdir -pm 755 /EntryDir
chmod -R a+x  /EntryDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryDir

# その他いろいろ用のフォルダの作成
mkdir -pm 777 /OtherDir
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherDir
