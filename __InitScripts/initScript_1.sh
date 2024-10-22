#!/usr/bin/bash

# 必要なパッケージの取得
apt update
apt -y install sudo neofetch

# ビルド時に必要なスクリプトを置くフォルダの作成
mkdir  -pm 755 /BuildScripts
chmod -R a+x   /BuildScripts
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildScripts

# 実行時に必要なスクリプトを置くフォルダの作成
mkdir -pm 755 /EntryScript
chmod -R a+x  /EntryScript
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryScript

# その他いろいろ用のフォルダの作成
mkdir -pm 777 OtherData
chown -R "${__SOCL_USER}:${__SOCL_GROUP}" /OtherData
