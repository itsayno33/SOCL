#!/usr/bin/bash

# 環境変数の初期設定

# 初期値peeというユーザを作成、初期値powというPWを設定
export __SOCL_USER=${__SOCL_USER:="pee"}
export __SOCL_PASS=${__SOCL_PASS:=""}
useradd -mN /bin/bash -s ${__SOCL_USER}

# パスワードの指定があれば設定する。初期値は『無し』
if ["{$__SOCL_PASS}" != ""]; then
    echo "${__SOCL_USER}:${__SOCL_PASS}" | chpasswd
fi

# ユーザーをグループに追加(初期値は同名)
export __SOCL_GROUP=${__SOCL_GROUP:=${__SOCL_USER}}
groupadd -f ${__SOCL_GROUP}
usermod  -g ${__SOCL_GROUP} ${__SOCL_USER}

# sudoでroot権限のコマンドを実行できるように指定
gpasswd -a ${__SOCL_USER} sudo

# ビルド時に必要なスクリプトを置くフォルダの作成
mkdir  -p /BuildScripts
chgmod -R a=+x /BuildScripts
chgown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildScripts

# その他いろいろ用のフォルダの作成
mkdir  -pm 777 /BuildData
chgown -R "${__SOCL_USER}:${__SOCL_GROUP}" /BuildData

# 実行時に必要なスクリプトを置くフォルダの作成
mkdir  -p /EntryScript
chgmod -R a=+x /EntryScript
chgown -R "${__SOCL_USER}:${__SOCL_GROUP}" /EntryScript
