#!/usr/bin/bash

# 必要なパッケージの取得(処理に時間がかかるのでテスト終了までコメントアウト)
apt-get update
apt-get install -y sudo

# 環境変数の初期化
# ユーザー名の設定。初期値はsocl
export __SOCL_USER=${__SOCL_USER:-socl}

# パスワードの指定があれば設定する。初期値は『socl』
export __SOCL_PASS=${__SOCL_PASS:-socl}

# グループ名の設定。初期値はusers
export __SOCL_GROUP=${__SOCL_GROUP:-users}

# 環境変数で指定されたユーザーの作成
source /__InitDir/createUser.sh

# 各種フォルダの作成
source /__InitDir/initDir.sh
